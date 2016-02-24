class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    @newest_articles = Article.order(created_at: 'desc').limit(10)
  end

  helper_method :login?
  def login?
    session[:login].present?
  end
end
