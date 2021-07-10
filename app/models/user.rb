class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :email :username :password, presence: true


end