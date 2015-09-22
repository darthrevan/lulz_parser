class Summoner < ActiveRecord::Base
  has_many :champions, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
