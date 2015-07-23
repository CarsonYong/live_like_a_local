class RenameLocationsToCitiesRemoveUserId < ActiveRecord::Migration
  def change
    remove_reference(:locations, :user_id)
    rename_table(:locations, :cities)
  end
end
