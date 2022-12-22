class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(public: true).includes([:user])
  end
end
