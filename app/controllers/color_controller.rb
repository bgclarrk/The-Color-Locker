class ColorController < ApplicationController
    before_action :find_color_by_id, only: [:show, :edit, :update, :destroy]

    def index
        @colors = Color.all
    end

    def new
        @color.new
    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy
        @color.destroy
        redirect_to new_color_path
    end

    private

    def color_params
        params.require(color).permit(:hexidecimal, :palette_id)
    end

    def find_color_by_id
        @color = Color.find_by_id(params[:id])
    end

end