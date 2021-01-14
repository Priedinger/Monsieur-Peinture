class RealisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index

    if params[:query].present?
      @realisations = Realisation.where(category: params[:query])
    else
      @realisations = Realisation.all
    end
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
    redirect_to admin_path, notice: "Réalisation editée"

  end

  def destroy
    @realisation = Realisation.find(params[:id])
    @realisation.destroy
    redirect_to admin_path, notice: "Réalisation supprimée !"
  end

    private

  def realisation_params
    params.require(:realisation).permit(:title, :category, :client, :localization, :agency, :artist, :surface, :duration, :photo_credits, :description, photos: [])
  end

end
