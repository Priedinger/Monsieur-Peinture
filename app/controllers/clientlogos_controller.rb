class ClientlogosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    @clientlogos = Clientlogo.all
  end

  def show
    @clientlogo = Clientlogo.find(params[:id])
  end

  def new
    @clientlogo = Clientlogo.new
  end

  def create
    @clientlogo = Clientlogo.new(clientlogo_params)
    @clientlogo.save
    redirect_to admin_path, notice: "Logo client ajouté"
  end

  def edit
    @clientlogo = Clientlogo.find(params[:id])
  end

  def update
    @clientlogo = Clientlogo.find(params[:id])
    @clientlogo.update(clientlogo_params)
    redirect_to admin_path, notice: "Logo client modifiée"
  end

  def destroy
    @clientlogo = Clientlogo.find(params[:id])
    @clientlogo.destroy
    redirect_to admin_path, notice: "Logo client supprimée"
  end

    private

  def clientlogo_params
    params.require(:clientlogo).permit(:name, :published, :photo)
  end
end
