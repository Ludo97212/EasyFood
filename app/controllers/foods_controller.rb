class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def homepage
    @best_foods = Food.first(12)
    @foods = Food.all
    @categories = Category.all
    # TEST BEST_FOODS
    # @best_foods = Food.joins(:ratings).order_by(average(score: DESC)).first(8)
    # @best_foods = Food.ratings.average(:score).order_by(:desc).first(8)
    @modal_text = "Depuis qu't'es parti, j'me prends la tête, j'ai lu tous les livres d'Hermann Hesse
      L'impression de mieux comprendre tes textes et tes yeux glacés comme ceux des immortels
      Comme tous ceux qui choisissent de se taire, t'avais l'énergie, l'aura puissante (Puissante)
      J'm'en rappellerai toujours, même quand la vie n'aura plus d'sens
      Enterrer nos armes dans la terre et le sable, on est l'espèce humaine
      La pierre et le sabre, la parfaite lumière, ceux qui ont péri le savent
      C'est toi qui as fait le logo, on le porte sur le cœur, comme tous ceux qu'on a perdus, c'est la vie ma le-gueu
      Et le vice de l'orgueil, j'en veux plus dès lors que tu recollais les miens
      Le cœur sur la main, ton binôme inconsolable
      Depuis, même quand l'ciel est bleu, les Tortues Ninja courent sous la pluie
      Loin de la surface, tout là-haut, les bons se retrouveront paraît-il
      On espère que tu surferas si Dieu le veut, sur une des quatre rivières du Paradis
      Crois pas qu'on t'oublie
      "
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
    set_food
    # create a rating on this show
    @rating = Rating.new
    @f_ratings = @food.ratings
    # ------------AVG SCORE------------------------------- #
    # Round(1) == Garder 1 chifffre apres la virgule
    @avg_score = @f_ratings.average(:score).to_f.round(1)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
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
    params.require(:food).permit(:name, :recipe, :user_id, :photo)
  end
end
