require 'rails_helper'

RSpec.describe 'RecipeFood', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Kolly', email: 'kolly@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measurementUnit: 'kg', price: 4) }
  let(:recipe) do
    user.recipes.create(name: 'Pizza', cookingTime: 1, preparationTime: 2, description: 'hgghghghghh', public: false)
  end
  describe 'GET /index' do
    before do
      sign_in user
      get new_recipe_recipe_food_path(recipe)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Add Recipe Food')
    end
  end
end
