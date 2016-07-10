class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
     @recipie=Recipe.create(recipe_params)
     redirect_to recipe_path(@recipie)
  end

private
  def recipe_parmas
     params.require(:recipie).permit(:title, :ingredients_attributes [:name, :quantity])
  end
end
