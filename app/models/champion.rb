class Champion < ActiveRecord::Base
  CHAMPION_ROLES = %i[top jungle mid adc support]

  belongs_to :summoner
  validates :role, inclusion: { in: CHAMPION_ROLES }, :allow_nil => true

  def self.set_role(champion_name, role)
    Summoner.all.map(&:champions).flatten.select { |f| f.name == champion_name }.each do |c|
      c.update_attributes(role: role)
    end
  end

  def self.get_best_by_role(role, count = 1)
    Champion.where(role: role).sort_by(&:lss).reverse.first
  end

  def self.get_worst_by_role(role,  count = 1)
    Champion.where(role: role).sort_by(&:lss).reverse.first
  end
end
