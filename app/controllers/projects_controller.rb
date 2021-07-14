class ProjectsController < ApplicationController
    before_action :authenticated?
    before_action :find_project, only: [:index, :edit, :update, :show, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        project = Project.create(project_params)
        project.user = User.find_by_id(session[:user_id]) #Need to create helper method
        project.save
        redirect_to project_path(project)
    end

    def edit

    end

    def update
        if session[:user_id] == @project.user_id
            @project.title = params[:project][:title]
            @project.description = params[:project][:description]
            @project.save
            redirect_to project_path(@project)
        else
            render edit_project_path(@project) #Need to add error
        end
    end

    def show

    end
    
    def destroy
        @project.destroy
    end
    
    private
    
    def project_params
        params.require(:project).permit(:title, :description, :user_id)
    end
    
    def find_project
        @project = Project.find_by_id(params[:id])
    end

end