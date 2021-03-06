class Sight < ActiveRecord::Base
  
  attr_accessor :city

  belongs_to :location
  has_many :user_sights
  has_many :users, through: :user_sights

  validates :sight_name, presence: true
  
  def city
    loc = Location.find(self.location_id)
    return loc.city
  end

end