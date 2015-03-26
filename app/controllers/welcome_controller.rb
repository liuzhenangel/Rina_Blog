class WelcomeController < ApplicationController
  def index
    @newest = Article.order(created_at: :desc).first.to_html
    @comments = @newest.comments.order(created_at: :desc)
  end

  def rss
    @articles = Article.all.order(created_at: :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end
