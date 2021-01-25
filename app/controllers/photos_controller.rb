class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    if params[:photo]
      @photo = Photo.new(photo_params)
      nb_of_photos = params[:photo][:photos].count
      photos = params[:photo][:photos]
      photos.each do |photo|
        create_one(photo)
      end
      redirect_to admin_path
    else
      redirect_to new_photo_path, notice: 'Ajoutez au moins une photo'
    end
  end

  def create_one(photo)
    @photo = Photo.new(photos: photo)
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

  private

  def photo_params
    params.require(:photo).permit(:realisation_id, photos: [])
  end
end
