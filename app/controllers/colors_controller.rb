class ColorsController < ApplicationController
    before_action :find_color_by_id, only: [:show, :edit, :update, :destroy]

    def new
        if Palette.find_by_id(params[:palette_id])
            @color = Color.new
            @color.palette = Palette.find_by_id(params[:palette_id])
        else
            flash[:alert] = "We could not find that palette."
            redirect_to palettes_path()
        end
    end

    def create
        @color = Color.new
        @color.hexidecimal = params[:color][:hexidecemal]
        if @color.palette = assign_palette_to_color
            if @color.save
                redirect_to palette_color_path(@color, @color.palette)
            else
                flash[:alert] = "There was an issue creating this color. Please try again."
                render new_palette_color_path(@color.palette)
            end
        else
            flash[:alert] = "We could not find that palette. Please try again."
            render palettes_path
        end
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

    def assign_palette_to_color
        Palette.find_by_id(params[:palette_id])
    end

end