class Location < ActiveRecord::Base
  has_many :users
  has_many :locals, source: :users
  has_many :sights  

  # def initalize(city, country)
  #   @city = city
  #   @country = country

  # end

  
end