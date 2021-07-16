class Palette < ApplicationRecord
    belongs_to :user
    has_many :projects
    has_many :colors
    
    validates :name, presence: true

    def find_palette_by_id
        @palette = Palette.find_by_id(params[:id])
    end
    
end