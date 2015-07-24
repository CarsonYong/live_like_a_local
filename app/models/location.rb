class Location < ActiveRecord::Base
  
  has_many :users
  has_many :locals, source: :users
  has_many :sights  

end