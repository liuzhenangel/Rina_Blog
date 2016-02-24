class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).limit(8)
  end

  def rss
    @articles = Article.all.order(created_at: :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def about
    @self_info = Article.self_info
  end

  def photo
    @photos = Photo.photo_album
    flash[:notic] = '主人还未上传相片' if @photos.blank?
    render :layout=>'photo'
  end
end
