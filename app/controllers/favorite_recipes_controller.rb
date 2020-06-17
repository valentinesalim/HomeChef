class FavoriteRecipesController < ApplicationController

  def index
    authorize current_user
    @recipe = current_user.favorites.first
    @recipes = current_user.favorites
  end

end
