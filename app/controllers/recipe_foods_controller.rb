class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
    if recipe_food.save
      flash[:notice] = 'Food added successfully.'
      redirect_to @recipe
    else
      render :new
      flash[:notice] = 'Something went wrong!! Food added.'
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(update_params)
      flash[:success] = 'Recipe Food has been updated successfully.'
    else
      flash[:error] = 'Something went wrong!! Recipe Food was not updated.'
    end
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Food was deleted successfully.'
    redirect_to @recipe
  end

  private

  def update_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
