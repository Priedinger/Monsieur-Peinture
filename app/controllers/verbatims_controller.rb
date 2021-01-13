class VerbatimsController < ApplicationController

    skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    @verbatims = Verbatim.all
  end

  def show
    @verbatim = Verbatim.find(params[:id])
  end

  def new
    @verbatim = Verbatim.new
  end

  def create
    @verbatim = Verbatim.new(verbatim_params)
    @verbatim.save
    redirect_to root_path, notice: "Logo client ajouté"
  end

  def edit
    @verbatim = Verbatim.find(params[:id])
  end

  def update
    @verbatim = Verbatim.find(params[:id])
    @verbatim.update(verbatim_params)
    redirect_to root_path, notice: "Logo client modifiée"

  end

  def delete
    @verbatim = Verbatim.find(params[:id])
    @verbatim.destroy
    redirect_to root_path, notice: "Logo client supprimée"
  end

    private

  def verbatim_params
    params.require(:verbatim).permit(:author, :citation, :photo)
  end
end
