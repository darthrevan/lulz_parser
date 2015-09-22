class Champion
  CHAMPION_ROLES = %i[top jungle mid adc support]
  include Mongoid::Document
  field :name, type: String
  field :role, type: String
  field :position, type: Integer
  field :icon, type: String
  field :lss, type: Integer
  field :performance, type: Float

  embedded_in :summoner, inverse_of: :champions
  validates :role, inclusion: { in: CHAMPION_ROLES }, :allow_nil => true

  def self.set_role(champion_name, role)
    Summoner.all.map(&:champions).flatten.select { |f| f.name == champion_name }.each do |c|
      c.update_attributes(role: role)
    end
  end

  def self.get_all
    Summoner.all.map(&:champions).flatten
  end

  def self.get_best_by_role(role, count = 1)
    Champion.get_all.select{ |c| c.role == role }.sort_by(&:lss).reverse.first
  end

  def self.get_worst_by_role(role,  count = 1)
    Champion.get_all.select{ |c| c.role == role }.sort_by(&:lss).reverse.first
  end
end
