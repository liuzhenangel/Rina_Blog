class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @newest_articles = Article.order(created_at: :desc)
    if @newest_articles.size > 20
      @newest_articles[0..20]
    else
      @newest_articles
    end
  end

  helper_method :login?
  def login?
    session[:login].present?
  end
end
