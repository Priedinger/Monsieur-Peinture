class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    @articles = Article.all.where(published: true)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to admin_path, notice: "Article ajouté"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admin_path, notice: "Article modifiée"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_path, notice: "Article supprimée"
  end

  def publish
    @article = Article.find(params[:id])
    if @article.published == true
      @article.published = false
      @article.save
      redirect_to admin_path, notice: "Article hors ligne"
    else
      @article.published = true
      @article.save
      redirect_to admin_path, notice: "Article en ligne"
    end
  end

    private

  def article_params
    params.require(:article).permit(:title, :published, :content, photos: [])
  end
end
