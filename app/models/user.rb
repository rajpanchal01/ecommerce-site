class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_one :cart,dependent: :delete
    has_many :user_addresses
    has_many :payments
    has_many :reviews
    has_one :Wishlist ,dependent: :delete
end
