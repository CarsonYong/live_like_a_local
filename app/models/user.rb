class User < ActiveRecord::Base
  belongs_to :location
  has_many :sight :through :user_sights
end