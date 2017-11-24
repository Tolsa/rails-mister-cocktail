class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end

  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
