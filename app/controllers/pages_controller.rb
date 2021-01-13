class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home , :services, :about, :contact]

  def home
    @current_banners = Banner.all
    @current_logos = Clientlogo.all
    @current_verbatims = Verbatim.all
  end

  def services
  end

  def about
  end

  def contact
  end
end
