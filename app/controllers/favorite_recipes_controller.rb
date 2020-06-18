class FavoriteRecipesController < ApplicationController

  def index
    @favorite_recipes = policy_scope(FavoriteRecipe)
    @favorite_recipes_of_this_week = current_user.favorites_of_this_week
    @favorite_recipes_before_this_week = current_user.favorites_before_this_week
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite_recipe = FavoriteRecipe.new(user: current_user, recipe: @recipe)
    notice = @favorite_recipe.save ? "You added #{@recipe.name} to your cookbook" : 'Error: Nothing happened.'
    authorize @favorite_recipe
    redirect_to recipe_path(@recipe), notice: notice
  end

  def destroy
    @favorite_recipe = FavoriteRecipe.find(params[:id])
    authorize @favorite_recipe
    @recipe = @favorite_recipe.recipe
    @favorite_recipe.destroy
    redirect_to recipe_path(@recipe), notice: "You removed #{@recipe.name} from your cookbook"
  end

end
