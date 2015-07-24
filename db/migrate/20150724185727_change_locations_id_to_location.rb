class ChangeLocationsIdToLocation < ActiveRecord::Migration
  def change
    rename_column(:sights, :locations_id, :location_id)
    rename_column(:users, :locations_id, :location_id)
  end
end
