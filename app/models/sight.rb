class Sight < ActiveRecord::Base
  belongs_to :location
  has_many :users, source: :user_sights
  attr_accessor :city

  def city
    loc = Location.find(self.location_id)
    return loc.city
  end
end