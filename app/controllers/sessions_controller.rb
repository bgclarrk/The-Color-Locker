class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(username: params[:user][:username])
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id

        redirect_to '/projects'
    end

    def destroy
        session[:user_id].clear if session[:user_id].present?
    end
    
end