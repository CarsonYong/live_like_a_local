class Sight < ActiveRecord::Base
  belongs_to :location
  has_many :user, through: :user_sights
end