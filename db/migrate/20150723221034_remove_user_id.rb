class RemoveUserId < ActiveRecord::Migration
  def change
    remove_column(:locations, :user_id, "integer")
  end
end
