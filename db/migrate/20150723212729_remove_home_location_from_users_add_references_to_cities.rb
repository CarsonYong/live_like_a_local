class RemoveHomeLocationFromUsersAddReferencesToCities < ActiveRecord::Migration
  def change
    remove_column(:users, :home_location)
    add_reference(:users, :city_id)
  end
end
