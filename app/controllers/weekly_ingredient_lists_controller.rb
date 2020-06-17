class WeeklyIngredientListsController < ApplicationController

  def index
    @weekly_ingredient_lists = WeeklyIngredientList.all
    authorize @weekly_ingredient_lists
    @ingredients = Ingredient.all
    @weekly_ingredients = WeeklyIngredient.all
    authorize @weekly_ingredients
    # FOR DEMO PURPOSES WE WILL ONLY HAVE ONE LIST OF THAT WEEK
    # FUTURE -> make sure only this week's list is displayed
  end

  # NEW, CREATE, DESTROY ONLY NEEDED WHEN WE INTRODUCE ADMIN USER
  # def new
  #   @weekly_ingredient_list = WeeklyIngredientList.new
  #   @ingredient = Ingredient.find(params[:ingredient_id])
  # end

  # def create
  #   @weekly_ingredient_list = WeeklyIngredientList.new(weekly_ingredient_list_params)
  #   @ingredient = Ingredient.find(params[:ingredient_id])
  #   @weekly_ingredient_list.ingredient = @ingredient

  #   if @weekly_ingredient_list.save
  #     redirect_to ingredient_path(@ingredient)
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @weekly_ingredient_list = WeeklyIngredientList.find(params[:id])
  #   @weekly_ingredient_list.destroy
  #   redirect_to root_path(@ingredient)
  # end

  def show
    @ingredients = policy_scope(Ingredient)

    @weekly_ingredient_list = WeeklyIngredientList.find(params[:id])
    authorize @weekly_ingredient_list
    @ingredients = Ingredient.all
    @weekly_ingredients = WeeklyIngredient.all

    # @recipe should not be used here, will remove later
    @recipe = @weekly_ingredient_list.recipes.first
    @recipes = @weekly_ingredient_list.recipes.all

  end

  private

  def weekly_ingredient_list_params
    params.require(:weekly_ingredient_list).permit(:date, :published, :price_per_portion, :menu_name, :weekly_ingredient_id, :ingredient_id)
  end

end
