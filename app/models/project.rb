class Project < ApplicationRecord
    belongs_to :user
    belongs_to :palette

    validates :title, :description, presence: true

end