class DoneRecipesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @done_recipe = DoneRecipe.new(recipe: @recipe, user: current_user)
    authorize @done_recipe
    notice = @done_recipe.save ? "You have successfully marked #{@recipe.name} as done." : "Sorry, something went wrong :("
    redirect_to recipe_path(@recipe)
  end
  
end