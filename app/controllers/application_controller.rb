class ApplicationController < ActionController::Base

    def authenticated?
        if !logged_in?
            redirect_to '/login'
        end
    end

    def logged_in?
        session[:user_id]
    end

    def current_user
        @user = User.find_by_id(session[:user_id])
    end

end