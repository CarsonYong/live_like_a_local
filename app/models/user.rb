class User < ActiveRecord::Base
  belongs_to :location
  has_many :sights, source: :user_sights

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /(\w+\.?\w+@\w+\.\w+)/, message: 'is not a valid email'}
  validates :password, presence: true, length: { minimum: 8 }, format: {with: /([a-zA-Z0-9@*#_-]{8,25})/, message: 'is not a valid password'}

end
