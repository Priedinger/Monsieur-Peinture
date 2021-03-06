class VerbatimsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    @verbatims = Verbatim.all
    respond_to do |format|
      format.html
      format.json { render json: { verbatims: @verbatims } }
    end
  end

  def show
    @verbatim = Verbatim.find(params[:id])
  end

  def new
    @verbatim = Verbatim.new
  end

  def create
    @verbatim = Verbatim.new(verbatim_params)
    @verbatim.insert_at(1)
    @verbatim.save
    redirect_to admin_path, notice: "Logo client ajouté"
  end

  def edit
    @verbatim = Verbatim.find(params[:id])
  end

  def update
    @verbatim = Verbatim.find(params[:id])
    @verbatim.update(verbatim_params)
    redirect_to admin_path, notice: "Logo client modifiée"
  end

  def destroy
    @verbatim = Verbatim.find(params[:id])
    @verbatim.destroy
  end

  def move
    @verbatim = Verbatim.find(params[:id])
    @verbatim.insert_at(params[:position].to_i)
    head :ok
  end

  def publish
    @verbatim = Verbatim.find(params[:id])
      if @verbatim.published == true
        @verbatim.published = false
        @verbatim.save
      else
        @verbatim.published = true
        @verbatim.save
      end
  end

    private

  def verbatim_params
    params.require(:verbatim).permit(:author, :citation, :published, :photo)
  end
end
