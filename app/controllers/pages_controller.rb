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
    @all_banners = Banner.all
    @all_clientlogos = Clientlogo.all
    @all_verbatims = Verbatim.all
    @displayed_counter = Counter.first
    @all_realisations = Realisation.all
    @all_articles = Article.all
  end
end
