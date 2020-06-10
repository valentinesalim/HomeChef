class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index

    @recipes = policy_scope(Recipe)
    @recipes = Recipe.all
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
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe= Recipe.find(params[:id])
    authorize @recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category, :description, :serving_time, :level, :total_price, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end
end
