class Summoner
  include Mongoid::Document
  field :name, type: String

  embeds_many :champions

  validates :name, uniqueness: true, presence: true
end
