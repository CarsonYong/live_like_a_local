class CreateItinerarySightsTable < ActiveRecord::Migration
  def change
    create_table :intinerary_sights do |t|
      t.references :sights
      t.references :intinerary_users 
    end
  end
end
