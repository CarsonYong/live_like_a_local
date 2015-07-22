class UsersSights < ActiveRecord::Migration
  def change
    create_table :users_sights do |t|
      t.references :user
      t.references :sight
    end
  end
end