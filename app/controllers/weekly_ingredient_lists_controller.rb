class WeeklyIngredientListsController < ApplicationController

  def index
    @weekly_ingredient_lists = WeeklyIngredientList.all
    authorize @weekly_ingredient_lists
    @ingredients = Ingredient.all
    @weekly_ingredients = WeeklyIngredient.all
    authorize @weekly_ingredients
  end

  def show
    @weekly_ingredient_list = WeeklyIngredientList.find(params[:id])
    authorize @weekly_ingredient_list
    @weekly_ingredients = WeeklyIngredient.all
    @recipes = @weekly_ingredient_list.recipes
  end

  private

  def weekly_ingredient_list_params
    params.require(:weekly_ingredient_list).permit(:date, :published, :price_per_portion, :menu_name, :weekly_ingredient_id, :ingredient_id)
  end

end
