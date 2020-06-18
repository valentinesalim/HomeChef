class RatingsController < ApplicationController
    before_action :set_done_recipe, only: [:new, :create]
    def new
        @rating = Rating.new
        authorize @rating
    end

    def create
        set_done_recipe
        @rating = Rating.new(rating_params)
        @rating.done_recipe = @done_recipe
        authorize @rating
        notice = @rating.save ? "Thank you, your rating is successfully added" : "Sorry. there's something wrong :("
        redirect_to recipe_path(@done_recipe.recipe), notice: notice
      end

    private
    def rating_params
        params.require(:rating).permit(:star, :content)
    end

    def set_done_recipe
        @done_recipe = DoneRecipe.find(params[:done_recipe_id])
    end
end
