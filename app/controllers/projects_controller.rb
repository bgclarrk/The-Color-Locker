class ProjectsController < ApplicationController

    def index
        @user = User.find(session[:user_id])
    end

    private


end