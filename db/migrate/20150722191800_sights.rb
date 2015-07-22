class Sights < ActiveRecord::Migration
  def change
    create_table :sights do |t|
      t.string :sight_name
      t.string :category
      t.string :feature
      t.references :locations
    end
  end
end
