class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @champions = Champion.get_all.sort_by(&:lss).reverse
    @best_picks = []
    Champion::CHAMPION_ROLES.each do |r|
      @best_picks << { r => Champion.get_best_by_role(r.to_s, 2) }
    end
  end

  def fetch_info
    Summoner.all.each do |s|
      SummonerParser.new(s.id).perform
    end
    
    redirect_to root_url
  end
end
