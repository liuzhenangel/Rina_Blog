class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    @newest_articles = Article.order(created_at: :desc)
    if @newest_articles.size > 20
      @newest_articles[0..20]
    else
      @newest_articles
    end
  end
end
