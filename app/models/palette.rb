class Palette < ApplicationRecord
    has_many :projects
    has_many :users, through: :projects
    has_many :colors
    
    validates :name, presence: true

    def find_palette_by_id
        @palette = Palette.find_by_id(params[:id])
    end
    
end