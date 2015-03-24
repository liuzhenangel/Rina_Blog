class Admin::PostsController < ApplicationController
  layout 'admin'
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_posts_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
