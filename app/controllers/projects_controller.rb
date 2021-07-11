class ProjectsController < ApplicationController

    def index
        @user = User.find(session[:user_id]) # Need to abstract out
        @projects = Projects.all
    end

    def new
        @project = Project.new
    end

    def create

    end

    def edit

    end

    def update

    end

    def show

    end

    def destroy

    end

    private

    def project_params
        params.require(:projects).permit(:title, :description, :user_id)
    end

end