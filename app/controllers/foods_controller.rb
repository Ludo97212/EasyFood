class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def homepage
    @best_foods = Food.last(12)
    # @best_foods = Food.joins(:ratings).order_by(score: DESC).limit(6)
    @categories = Category.all
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @foods = Food.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
      flash[:notice] = "#{@foods.size} résultat(s)"
    else
      @foods = Food.all.order(:created_at)
    end
  end

  def show
  end

  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def delete
  # end

   private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :price, :description, :user_id, :photo)
  end
end
