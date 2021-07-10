class UsersController < ApplicationController

    def create
        User.create(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end