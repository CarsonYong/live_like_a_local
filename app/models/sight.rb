class Sight < ActiveRecord::Base
  belongs_to :location
  has_many :users, source: :user_sights
end