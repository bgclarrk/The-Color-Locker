class Project < ApplicationRecord
    belongs_to :user
    belongs_to :palette

    validates :title, :description, presence: true

    scope :authored, -> (user_id) { where("user_id: ?", user_id) }

    def self.authored(user_id)
        where("user_id: ?", user_id)
    end

end