class PalettesController < ApplicationController
    before_action :authenticated?
    before_action :find_palette_by_id, only: [:show, :edit, :update, :destroy]
    
    def index
        @palettes = Palette.all
    end

    def new
        @palette = Palette.new
    end

    def create
        @palette = Palette.create(palette_params)
        if @palette
            redirect_to palette_path(@palette)
        else
            flash.now[:errors] = @palette.errors.full_messages
            render new_palette_path
        end
    end

    def show
        
    end

    def edit

    end

    def update
        @palette.name = params[:palette][:name]
        if @palette.save
            redirect_to palette_path(@palette)
        else
            flash.now[:errors] = @palette.errors.full_messages
            render edit_palette_path(@palette)
        end
    end

    def destroy
        @palette.destroy
        redirect_to palettes_path
    end

    private

    def palette_params
        params.require(:palette).permit(:name, :project_id)
    end

    def find_palette_by_id
        @palette = Palette.find_by_id(params[:id])
    end

end