class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).limit(8)
    @meta_description = 'Rina\'s 个人博客, 分享生活, 工作与技术的相关文章'
  end

  def rss
    @articles = Article.all.order(created_at: :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def about
    @self_info = Article.self_info
    @meta_description = 'Rina\'s 个人信息, 关于工作经历及个人简介.'
  end

  def photo
    @photos = Photo.photo_album
    flash[:notic] = '主人还未上传相片' if @photos.blank?
    render :layout=>'photo'
  end
end
