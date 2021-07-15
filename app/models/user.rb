class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :palettes, through: :projects

    validates :email, presence: true
    validates :username, :password, :email, presence: true


end