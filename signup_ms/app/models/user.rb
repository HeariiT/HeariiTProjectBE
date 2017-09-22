class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable#,:confirmable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true, length: {minimum: 5 }
  validates :username, format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\Z/ }
  validates :first_name, :last_name, length: {minimum: 3}
  validates_format_of :first_name, :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :first_name, :last_name, length: {maximum: 35}
  validates :username, length: {maximum: 25}
  
end
