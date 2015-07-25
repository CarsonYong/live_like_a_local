class AddInstagramToSights < ActiveRecord::Migration
  def change
    add_column(:sights, :instagram_location, :integer)
  end
end
