class User < ApplicationRecord
  validates :email, presence: true,
            uniqueness: {message: "Email Already Taken"}
  validates :password, presence: true
  has_many :favorites
  has_secure_password
end
