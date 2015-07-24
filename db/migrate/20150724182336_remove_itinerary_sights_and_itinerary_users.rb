class RemoveItinerarySightsAndItineraryUsers < ActiveRecord::Migration
  def change
    drop_table(:intinerary_sights)
    drop_table(:intinerary_users)
  end
end
