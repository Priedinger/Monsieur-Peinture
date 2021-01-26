class RealisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    if params[:query].present?
      @realisations = Realisation.where(category: params[:query], published: true)
    else
      @realisations = Realisation.all.where(published: true).order(:position)
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
    @realisation.insert_at(1)
    @realisation.save
    redirect_to new_photo_path(realisation_id:[@realisation.id])
  end

  def edit
    @realisation = Realisation.find(params[:id])
  end

  def update
    @realisation = Realisation.find(params[:id])
    @realisation.update(realisation_params)
    unless @realisation.newphotos.empty?
      @realisation.newphotos.each do |newphoto|
        newphoto.name = :photos
        newphoto.save
      end
    end
    redirect_to admin_path, notice: "Réalisation editée"
  end

  def destroy
    @realisation = Realisation.find(params[:id])
    @realisation.destroy
  end

  def move
    @realisation = Realisation.find(params[:id])
    @realisation.insert_at(params[:position].to_i)
    head :ok
  end

  def publish
    @realisation = Realisation.find(params[:id])
      if @realisation.published == true
        @realisation.published = false
        @realisation.save
      else
        @realisation.published = true
        @realisation.save
      end
  end

    private

  def realisation_params
    params.require(:realisation).permit(:title, :category, :client, :localization, :agency, :artist, :surface, :duration, :photo_credits, :description, :published, photos: [], newphotos: [])
  end
end
