class Palette < ApplicationRecord
    belongs_to :user
    has_many :projects
    has_many :colors
    
    validates :name, presence: true
    
end