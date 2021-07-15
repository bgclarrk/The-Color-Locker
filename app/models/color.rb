class Color < ApplicationRecord
    belongs_to :palette
    validates :hexidecimal, presence: true
    
end