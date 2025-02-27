class User < ApplicationRecord
    has_secure_password
    has_many :posts
    validates :email, presence:true , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create ,message:"invalid email input"}
end
