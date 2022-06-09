class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  def homepage
    @last_foods = Food.last(10)
  end

  def index
    @foods = Food.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

   private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :price, :description, :user_id, :photo)
  end
end
