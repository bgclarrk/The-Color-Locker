class PalettesController < ApplicationController
    before_action :find_palette, only: [:show, :edit, :update, :destroy]
    
    def index
        @palettes = Palette.all
    end

    def new
        @palette = Palette.new
    end

    def create
        @palette = Palette.new
        @palette.subject = params[:palette][:subject]
        byebug
        if @palette.save
            redirect_to palette_path
        else
            render new_palette_path #need to add flash error
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy
        @palette.destroy
    end

    private

    def palette_params
        params.require(:palette).permit(:name, :project_id)
    end

    def find_palette
        @palette = Palette.find_by_id(params[:id])
    end

end