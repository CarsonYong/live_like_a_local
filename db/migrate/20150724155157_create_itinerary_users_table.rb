class CreateItineraryUsersTable < ActiveRecord::Migration
  def change
    create_table :intinerary_users do |t|
      t.string :name
      t.references :users 
    end
  end
end
