class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :set_weeklyingtedientlist, only: [:new, :create]
  # A user can see the list of orders
  def index
    @orders = current_user.orders
  end

  # POST "order"
  def create
    @order = Order.new
    authorize @order
    @order.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe
    @order.weekly_ingredient_list = @recipe.weekly_ingredient_list
    @ingredients = Ingredient.all
    authorize @ingredients
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  # A user can see any order page
  # GET "orders/id"
  def show
    @order = order.find(params[:id])
    authorize @order
  end

  private
  def set_order
    @order = order.find(params[:id])
  end

  def set_weeklyingtedientlist
    @weeklyingredientlist = WeeklyIngredientList.find_by_id(1)
  end

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_location, :amount_portion)
  end

end
