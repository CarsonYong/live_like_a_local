class User < ActiveRecord::Base

  attr_accessor :password, :city

  belongs_to :location
  has_many :user_sights
  has_many :sights, through: :user_sights

  before_create :encrypt_password

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /(\w+\.?\w+@\w+\.\w+)/, message: 'is not a valid email'}
  validates :password, presence: true, length: { minimum: 8 }, format: {with: /([a-zA-Z0-9@*#_-]{8,25})/, message: 'is not a valid password'}

  def encrypt_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def verify_password(password)
    self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt) ? true : false 
  end

end
