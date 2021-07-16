class PalettesController < ApplicationController
    before_action :find_palette_by_id, only: [:show, :edit, :update, :destroy]
    
    def index
        @palettes = Palette.all
    end

    def new
        @palette = Palette.new
    end

    def create
        @palette = Palette.new
        @palette.name = params[:palette][:name]
        @palette.user = current_user
        if @palette.save
            redirect_to palette_path(@palette)
        else
            flash[:alert] = "There was an issue creating this palette. Please try again."
            render new_palette_path
        end
    end

    def show

    end

    def edit

    end

    def update
        if session[:user_id] == @palette.user_id
            @palette.name = params[:palette][:name]
            @palette.save
            redirect_to palette_path(@palette)
        else
            flash[:alert] = "There was an issue updating this palette. Please try again."
            render edit_palette_path(@palette) #Need to add error
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