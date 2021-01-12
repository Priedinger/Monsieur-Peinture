class RealisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show,]

  def index
    @realisations = Realisation.all
  end

  def show
      @realisation = Realisation.find(params[:id])
  end

  def new
    @realisation = Realisation.new
  end

  def create
    @realisation = Realisation.new(realisation_params)
    @realisation.save
    redirect_to realisations_path, notice: "Réalisation crée"
  end

  def edit
    @realisation = Realisation.find(params[:id])
  end

  def update
    @realisation = Realisation.find(params[:id])
    @realisation.update(realisation_params)
  end

  def delete
    @realisation = Realisation.find(params[:id])
    @realisation.destroy
    redirect_to realisations_path, notice: "Réalisation mise à jour !"
  end

    private

  def realisation_params
    params.require(:realisation).permit(:title, photos: [])
  end

end
