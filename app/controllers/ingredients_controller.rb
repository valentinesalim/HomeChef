class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path(@ingredient)
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path, notice: 'Ingredient was successfully deleted.'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :price_per_unit, :photo)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end   
end
