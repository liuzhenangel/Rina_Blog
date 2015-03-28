class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).limit(8)
  end

  def rss
    @articles = Article.all.order(created_at: :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end
