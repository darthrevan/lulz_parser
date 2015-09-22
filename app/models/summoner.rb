class Summoner < ActiveRecord::Base
  has_many :champions

  validates :name, uniqueness: true, presence: true
end
