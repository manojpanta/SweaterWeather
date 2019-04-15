class User < ApplicationRecord
  validates :email, presence: true,
            uniqueness: {message: "Email Already Taken"}
  has_secure_password
end
