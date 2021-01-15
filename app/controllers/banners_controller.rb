class BannersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :edit, :delete ]

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.save
    redirect_to admin_path, notice: "Bannière crée"
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to admin_path, notice: "Bannière supprimée"
  end

  def move
    @banner = Banner.find(params[:id])
    @banner.insert_at(params[:position].to_i)
    head :ok
  end

    private

  def banner_params
    params.require(:banner).permit(:title, :photo)
  end
end
