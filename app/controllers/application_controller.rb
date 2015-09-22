class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @champions = Champion.all.sort_by(&:lss).reverse
    @best_picks = []
    Champion::CHAMPION_ROLES.each do |r|
      Champion.get_best_by_role(r.to_s, 3).each do |c|
        @best_picks << { r => c}
      end
    end
  end

  def fetch_info
    Summoner.all.each do |s|
      SummonerParser.new(s.id).perform
    end
    
    redirect_to root_url
  end
end
