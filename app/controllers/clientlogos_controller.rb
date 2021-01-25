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
    @clientlogo.insert_at(1)
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
  end

  def move
    @clientlogo = Clientlogo.find(params[:id])
    @clientlogo.insert_at(params[:position].to_i)
    head :ok
  end

  def publish
    @clientlogo = Clientlogo.find(params[:id])
    if @clientlogo.published == true
      @clientlogo.published = false
      @clientlogo.save
    else
      @clientlogo.published = true
      @clientlogo.save
    end
  end

    private

  def clientlogo_params
    params.require(:clientlogo).permit(:name, :published, :photo)
  end
end
