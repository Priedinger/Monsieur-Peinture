class PhotosController < ApplicationController

  def index
    @photos = Photo.all
     respond_to do |format|
      format.html
      format.json { render json: { photos: @photos } }
    end
  end

  def new
    @photo = Photo.new(realisation_id: params[:realisation_id])
  end

  def create
    if params[:photo]
      @photo = Photo.new(photo_params)
      photos = params[:photo][:photos]
      realisation_id = params[:photo][:realisation_id]
      photos.each do |photo|
        create_one(photo, realisation_id)
      end
      redirect_to admin_path
    else
      redirect_to new_photo_path, notice: 'Ajoutez au moins une photo'
    end
  end

  def create_one(photo, realisation_id)
    @photo = Photo.new(photos: photo, realisation_id: realisation_id)
    @photo.save
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to admin_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

  def move
    @photo = Photo.find(params[:id])
    @photo.insert_at(params[:position].to_i)
    head :ok
  end

  def publish
  @photo = Photo.find(params[:id])
    if @photo.published == true
      @photo.published = false
      @photo.save
    else
      @photo.published = true
      @photo.save
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:realisation_id, photos: [])
  end
end
