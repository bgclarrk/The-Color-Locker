class SessionsController < ApplicationController

    def new
        
    end

    def create
        if user = User.find_by(username: params[:user][:username])
            if user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to '/projects'
            else
                flash[:alert] = "There was an issue logging in. Please check username and password and try again."
                render 'sessions/new'
            end
        else
            flash[:alert] = "There was an issue logging in. Please check username and password and try again."
            render 'sessions/new'
        end
    end

    def destroy
        reset_session
        redirect_to '/login'
    end
    
end