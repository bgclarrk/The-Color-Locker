class Category < ApplicationRecord
    # belongs_to :project
    validates :subject, presence: true
    
end