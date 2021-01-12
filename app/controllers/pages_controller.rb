class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @current_banner = Banner.first
  end

  def services
  end

  def about
  end

  def contact
  end
end
