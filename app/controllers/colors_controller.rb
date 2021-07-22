class ColorsController < ApplicationController
    before_action :authenticated?
    before_action :find_color_by_id, only: [:edit, :update, :show]

    def new
        if Palette.find_by_id(params[:palette_id])
            @color = Color.new
            @color.palette = Palette.find_by_id(params[:palette_id])
        else
            flash[:errors] = @color.errors.full_messages
            redirect_to palettes_path()
        end
    end

    def create
        if Palette.find_by_id(params[:palette_id])
            params[:color][:hexidecimal].each do |color|
                color = Color.new(hexidecimal: color, palette_id: params[:palette_id])
                color.save
            end
            redirect_to palette_path(params[:palette_id])
        else
            flash[:errors] = @color.errors.full_messages
            render palettes_path
        end
    end

    def edit

    end

    def update
        if color = Color.find_by_id(params[:id])
            if color.palette_id == Palette.find_by_id(params[:palette_id]).id
                color.hexidecimal = params[:color][:hexidecimal]
                color.save
                redirect_to palette_path(params[:palette_id])
            else
                flash[:errors] = @color.errors.full_messages
                redirect_to palettes_path
            end
        else
            flash[:errors] = @color.errors.full_messages
            redirect_to palettes_path
        end
    end

    def show

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