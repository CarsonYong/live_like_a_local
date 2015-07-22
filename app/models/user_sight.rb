class UserSight < ActiveRecord::Base
  has_many :users 
  has_many :sights
end