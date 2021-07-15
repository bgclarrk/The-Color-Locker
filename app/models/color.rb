class Color < ApplicationRecord
    belongs_to :color
    validates :hexidecimal, presence: true
    
end