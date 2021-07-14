class CategoriesController < ApplicationController

    private

    def category_params
        params.require(category).permit(:subject, :project_id:)
    end

    def find_category
        Category.find_by_id(params[:id])
    end

end