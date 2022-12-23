require 'rails_helper'

RSpec.feature 'Public Recipes', type: :feature do
  before :each do
    @user = User.create(name: 'Cassian Andor', email: 'cassian@rebels.com', password: '123456')
    @recipe = Recipe.create(user: @user, name: 'Empiriral Broth', preparation_time: 5, cooking_time: 5,
                            description: 'Not the greatest food but Maarva made it special', public: true)

    visit root_path

    within('#new_user') do
      fill_in 'user_email', with: 'cassian@rebels.com'
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
  end

  it 'visits public recipes' do
    visit public_recipes_path
    expect(page).to have_content 'Empirial Broth'
  end

  it 'opens to Recipe Details page ' do
    visit public_recipes_path
    within("#recipe_#{@recipe.id}") do
      click_on @recipe.name
    end
    expect(current_path).to match user_recipe_path(@user, @recipe)
  end
end
