class ItineraryUser < ActiveRecord::Base
  
  has_many :itinerary_sites
  belongs_to :user

end