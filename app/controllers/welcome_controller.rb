class WelcomeController < ApplicationController
  def index
    @newest = Article.order(created_at: :desc).first
  end
end
