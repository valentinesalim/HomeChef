class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @recipes_user = Recipe.where(user: current_user)
        authorize @user
    end
end
