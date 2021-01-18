class CountersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :edit, :update]


  def edit
    @counter = Counter.find(params[:id])
  end

  def update
    @counter = Counter.find(params[:id])
    @counter.update(counter_params)
  end

    private
  def counter_params
    params.require(:counter).permit(:surface)
  end
end
