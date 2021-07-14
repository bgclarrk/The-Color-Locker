class Project < ApplicationRecord
    belongs_to :user
    belongs_to :palette

    def created_at_formatted
        self.created_at.strftime("%B %d, %Y")
    end

end