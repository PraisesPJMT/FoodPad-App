class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(public: true).includes([:user])
    @ingredients = RecipeFood.all.includes([:food])
    @ingredients_count = obtain_ingredient_count
    @ingredients_cost = obtain_ingredient_cost
  end

  private

  def obtain_ingredient_count
    @ingredients.size
  end

  def obtain_ingredient_cost
    cost = 0
    @ingredients.each do |ingredient|
      cost += ingredient.food.price.to_i * ingredient.quantity.to_i
    end
    cost
  end
end
