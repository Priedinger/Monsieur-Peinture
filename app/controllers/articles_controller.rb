class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :delete]

  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.json { render json: { articles: @articles } }
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.insert_at(1)
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
  end

  def move
    @article = Article.find(params[:id])
    @article.insert_at(params[:position].to_i)
    head :ok
  end

  def publish
    @article = Article.find(params[:id])
    if @article.published == true
      @article.published = false
      @article.save
    else
      @article.published = true
      @article.save
    end
  end

    private

  def article_params
    params.require(:article).permit(:title, :published, :content, photos: [])
  end
end
