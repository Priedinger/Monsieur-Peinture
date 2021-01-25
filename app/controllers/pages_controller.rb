class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home , :services, :about, :contact]

  def home
    @current_banners = Banner.all.where(published: true)
    @current_logos = Clientlogo.all.where(published: true)
    @current_verbatims = Verbatim.all.where(published: true)
    @displayed_counter = Counter.first
  end

  def services
  end

  def about
  end

  def contact
  end

  def admin
    @all_banners = Banner.all.order(:position)
    @all_clientlogos = Clientlogo.all.order(:position)
    @all_verbatims = Verbatim.all.order(:position)
    @displayed_counter = Counter.first
    @all_realisations = Realisation.all.order(:position)
    @all_articles = Article.all.order(:position)
    @all_photos = Photo.all
  end
end
