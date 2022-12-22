class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food).order(:id)
  end

  def new
    @recipe = Recipe.new
  end

  def update_public
    recipe = Recipe.find(params[:id])
    flash[:notice] = if recipe.update(public: !recipe.public)
                       "Successfully updated to #{recipe.public ? 'Public' : 'Private'}."
                     else
                       'Failed to update recipe.'
                     end
    redirect_to "/recipes/#{recipe.id}"
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user = current_user

    if recipe.save
      redirect_to "/recipes/#{recipe.id}"
      flash[:notice] = 'Recipe created Successfully'
    else
      redirect_to recipe
      flash.now[:notice] = 'Something went wrong! Recipe was not created!'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      redirect_to '/recipes'
      flash[:success] = 'Recipe deleted Successfully'
    else
      redirect_to recipe
      flash[:error] = 'Couldnt delete recipe'
    end
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
