class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(username: params[:user][:username])
            if user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to '/projects'
            else
                flash[:errors] = user.errors.full_messages
                render 'sessions/new'
            end
        flash[:errors] = user.errors.full_messages
        render 'sessions/new'
    end

    def destroy
        reset_session
        redirect_to '/login'
    end

    def omniauth
        google_info = request.env['omniauth.auth']['info']
        user = User.find_or_create_from_google(google_info)
        if user
            session[:user_id] = user.id
            redirect_to 'projects'
        else
            flash[:errors] = user.errors.full_messages
            redirect_to login_path
        end
    end
    
end