class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index

    @recipes = policy_scope(Recipe)
    @recipes = Recipe.all.order(name: :asc)
    @weekly_ingredients = WeeklyIngredient.all
    # IN CASE WE IMPLEMENT A SEARCH FEATURE:
    # if params[:query].present?
    #   @books = Recipe.search_or_filter(params[:query]).order(name: :asc)
    # elsif params[:filter]
    #   @filter = params[:filter][:query]
    #   @recipes = Recipe.all.search_or_filter("#{@filter}").order(name: :asc)
    # else
    #   @recipes = Recipe.all.order(name: :asc)
    # end
  end


  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe
    @recipe.user = current_user
    @weekly_ingredient_list = WeeklyIngredientList.find_by(date: Date.today.beginning_of_week)
    @recipe.weekly_ingredient_list = @weekly_ingredient_list
    
    youtube_id = YoutubeID.from(@recipe.video)
    @recipe.video = "https://www.youtube.com/embed/#{youtube_id}"
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @order = Order.new
    authorize @recipe
    @weekly_ingredients = WeeklyIngredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe= Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category, :description, :serving_time, :level, :total_price, :photo, :video)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end
end
