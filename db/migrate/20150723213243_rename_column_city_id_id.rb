class RenameColumnCityIdId < ActiveRecord::Migration
  def change
    rename_column(:users, :city_id_id, :city_id)
  end
end
