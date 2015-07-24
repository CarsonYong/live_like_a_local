class RenameUsersSightsTable < ActiveRecord::Migration
  def change
    rename_table(:users_sights, :user_sights)
  end
end
