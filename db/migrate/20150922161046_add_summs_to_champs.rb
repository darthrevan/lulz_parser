class AddSummsToChamps < ActiveRecord::Migration
  def change
    add_reference :champions, :summoner, index: true
  end
end
