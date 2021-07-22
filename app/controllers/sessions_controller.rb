class SessionsController < ApplicationController

    def new
        
    end

    def create
        if user = User.find_by(username: params[:user][:username])
            if user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to '/projects'
            else
                flash[:errors] = user.errors.full_messages
                render 'sessions/new'
            end
        else
            flash[:errors] = user.errors.full_messages
            render 'sessions/new'
        end
    end

    def destroy
        reset_session
        redirect_to '/login'
    end
    
end