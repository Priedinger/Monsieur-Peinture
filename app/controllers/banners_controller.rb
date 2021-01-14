class BannersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :edit, :delete ]

  def index
    @banners = Banner.all
  end

  def show
    @banner = Banner.find(params[:id])
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.save
    redirect_to root_path, notice: "Bannière crée"
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    @banner.update(banner_params)
    redirect_to admin_path, notice: "Bannière modifiée"

  end

  def delete
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to admin_path, notice: "Bannière supprimée"
  end

    private

  def banner_params
    params.require(:banner).permit(:title, :photo)
  end
end
