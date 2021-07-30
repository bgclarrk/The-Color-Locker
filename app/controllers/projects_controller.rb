class ProjectsController < ApplicationController
    before_action :authenticated?
    before_action :find_project_by_id, only: [:edit, :update, :show, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        @project.user = User.find_by_id(session[:user_id])
        @project.palette = Palette.find_by_id(params[:project][:palette_id])
        if @project.save
            redirect_to project_path(@project)
        else
            flash.now[:errors] = @project.errors.full_messages
            render new_project_path
        end
    end

    def edit

    end

    def update
        palette = Palette.find_by_id(params[:project][:palette_id])
        if session[:user_id] == @project.user_id
            @project.title = params[:project][:title]
            @project.description = params[:project][:description]
            @project.palette = palette
            @project.save
            redirect_to project_path(@project)
        else
            flash.now[:errors] = @project.errors.full_messages
            render edit_project_path(@project)
        end
    end

    def show

    end
    
    def destroy
        @project.destroy
        redirect_to projects_path
    end
    
    private
    
    def project_params
        params.require(:project).permit(:title, :description, :user_id, :pallete_id)
    end
    
    def find_project_by_id
        @project = Project.find_by_id(params[:id])
    end

end