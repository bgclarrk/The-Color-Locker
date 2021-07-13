class Project < ApplicationRecord
    belongs_to :user

    def created_at_formatted
        self.created_at.strftime("%B %d, %Y")
    end

end