class GenerateShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes(:food).order(:id)

    @missing_ingredients = @recipe_foods.select do |ingredient|
      ingredient.quantity.to_i > ingredient.food.quantity.to_i
    end
    @total_price = obtain_total_price
  end

  private

  def obtain_total_price
    total_price = 0
    @missing_ingredients.each do |ingredient|
      price = ingredient.food.price.to_i * (ingredient.quantity.to_i - ingredient.food.quantity.to_i)
      total_price += price
    end
    total_price
  end
end
