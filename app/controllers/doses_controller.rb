class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create, :destroy]

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all

  end

  def create
    @dose = Dose.new(dose_params)
    @dose = @cocktail.doses.build(dose_params)
    # plural because of relation in model. Is a ralation has_many: doses
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
