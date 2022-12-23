require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: '123456')
    @recipe = Recipe.new(user_id: @user.id, name: 'Apples', preparation_time: '01:04:33', cooking_time: '01:04:33',
                         description: 'Lorem ipsum', public: false)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end
  end
  context 'Testing Associations' do
    it 'has_many recipes' do
      assoc = Recipe.reflect_on_association(:recipe_foods)
      expect(assoc.macro).to eq :has_many
    end

    it 'belongs_to user' do
      assoc = Recipe.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
