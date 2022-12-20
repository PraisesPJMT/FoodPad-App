class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  # has_many :recipe_foods, class_name: 'RecipeFood', dependent: :delete_all

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
