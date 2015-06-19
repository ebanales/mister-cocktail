class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def show
  end

  def edit
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
