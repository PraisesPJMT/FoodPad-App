class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(public: true)
  end
end
