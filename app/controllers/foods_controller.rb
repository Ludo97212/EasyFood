class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def homepage
    @best_foods = Food.first(12)
    @foods = Food.all
    @categories = Category.all
    # TEST BEST_FOODS
    # @best_foods = Food.joins(:ratings).order_by(average(score: DESC)).first(8)
    # @best_foods = Food.ratings.average(:score).order_by(:desc).first(8)
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR recipe ILIKE :query"
      @foods = Food.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
      flash[:notice] = "#{@foods.size} résultat(s)"
    else
      @foods = Food.all.order(:created_at)
    end
  end

  def show
    # create a rating on this show
    @rating = Rating.new
    @f_ratings = @food.ratings.order(updated_at: :desc).limit(10)
    # ------------AVG SCORE------------------------------- #
    # Round(1) == Garder 1 chifffre apres la virgule
    @avg_score = @f_ratings.average(:score).to_f.round(1)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to food_path
      flash.notice "Votre recette a bien été créée."
    else
      render :new
      flash.now.notice "Erreur! Veuillez réessayer"
    end
  end

  def edit
  end

  def update
    @food = Food.update(food_params)
    if @food.update
      redirect_to food_path
      flash.notice "Votre recette a bien été modifiée."
    else
      render :edit
      flash.now.notice "Erreur! Veuillez réessayer"
    end
  end

  def delete
    if @food.destroy
      redirect_to foods_path
      flash.notice "Recette supprimée"
    else
      redirect_to food_path
      flash.now.notice "Erreur! Impossible de supprimer cette recette"
    end
  end

   private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :recipe, :user_id, :photo)
  end
end
