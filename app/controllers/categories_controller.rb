class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new
        @category.subject = params[:category][:subject]
        byebug
        if @category.save
            redirect_to category_path
        else
            render new_category_path #need to add flash error
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy
        @category.destroy
    end

    private

    def category_params
        params.require(:category).permit(:subject, :project_id)
    end

    def find_category
        @category = Category.find_by_id(params[:id])
    end

end