class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :set_weeklyingtedientlist, only: [:new, :create]
  # A user can see the list of orders
  def index
    @orders = current_user.orders
  end

  # GET "orders/new"
  def new
    @order = Order.new
    authorize @order
    @order.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @order.weekly_ingredient_list = @recipe.weekly_ingredient_list
    @ingredients = Ingredient.all
    @weekly_ingredient_list = @order.weekly_ingredient_list
    @weekly_ingredients = @weekly_ingredient_list.weekly_ingredients
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.user = current_user
    @recipe = Recipe.find(params[:order][:recipe_id])
    # @order.weekly_ingredient_list = @recipe.weekly_ingredient_list
    @ingredients = Ingredient.all
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  # A user can see any order page
  # GET "orders/id"
  def show
    authorize @order
  end

  private
  
  def set_order
    @order = Order.find(params[:id])
  end

  def set_weeklyingtedientlist
    @weeklyingredientlist = WeeklyIngredientList.find_by_id(1)
  end

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_location, :amount_portion, :weekly_ingredient_list_id)
  end

end
