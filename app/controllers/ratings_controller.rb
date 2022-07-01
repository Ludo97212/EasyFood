class RatingsController < ApplicationController
  def create
    set_food
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.food = @food
    if @rating.save
      redirect_to food_path(@food)
      flash[:success] = 'Envoyé!'
    else
      render "foods/show"
      flash[:alert] = 'Erreur!'
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      flash[:success] = "Modification réussie!"
    else
      flash[:alert] = "Erreur"
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to food_path
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :comment, :food_id, :user_id)
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end
