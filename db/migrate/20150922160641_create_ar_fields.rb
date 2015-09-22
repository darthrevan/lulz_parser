class CreateArFields < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.timestamps
    end

    create_table :champions do |t|
      t.string :name
      t.string :role
      t.string :position
      t.string :icon
      t.integer :lss
      t.float :performance
    end
  end
end
