class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to projects_path
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end