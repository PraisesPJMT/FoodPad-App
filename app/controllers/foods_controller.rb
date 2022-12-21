class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food added successfully.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
