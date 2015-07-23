class RemoveHomeLocationAndUserId < ActiveRecord::Migration
  def change
    remove_reference(:locations, :user_id)
    remove_column(:users, :home_location "string")
    add_reference(:users, :locations)
  end
end
