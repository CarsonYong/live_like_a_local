class RemoveUserIdFromCities < ActiveRecord::Migration
  def change
    remove_column(:cities, :user_id)
  end
end
