class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.order(created_at: :desc)
  end

  def search
    @newest_articles = Article.where("title like ? OR content like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    if params[:newest]
      @newest = Article.find(params[:newest])
      @comments = @newest.comments.order(created_at: :desc)
      render 'welcome/index'
    else
      @article = Article.find(params[:article])
      @comments = @article.comments.order(created_at: :desc)
      redirect_to @article
    end
  end
end
