class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    set_user
    @recipes_user = Recipe.where(user: current_user)
    @orders_user = Order.where(user: current_user)
    # @order = Order.find(params[:order_id])
    # @weekly_ingredient_list = @orders_user.weekly_ingredient_list
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :biography, :address, :email, :photo)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

end
