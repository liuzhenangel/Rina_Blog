class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]).to_html
    @comment = Comment.new
    @comments = @article.comments.order(created_at: :desc)
  end

  def search
    @articles = Article.where("title like ? OR content like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @articles.map do |a|
      a.title = a.title.gsub(params[:search], "<em>#{params[:search]}</em>")
      unless a.content.include?('/uploads/photo/image')
        a.content = a.content.gsub(params[:search], "<em>#{params[:search]}</em>")
      end
    end
  end
end
