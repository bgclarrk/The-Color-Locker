class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :palettes, through: :projects

    validates :email, presence: true
    validates :username, :password, :email, presence: true

    def self.find_or_create_from_google(google_info)
        find_or_create_by(email: google_info[:email]) do |user|
            user.username = google_info[:name]
            user.password = SecureRandom.hex
        end
    end

end