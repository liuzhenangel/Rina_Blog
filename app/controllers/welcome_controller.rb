class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc).limit(8)
  end

  def rss
    @articles = Article.all.order(created_at: :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def photo
    @dirs = Dir.glob("public/uploads/photo/image/*/*")
    @files = @dirs.map do |f|
      f = f.sub('public/','/')
      basename = File.basename(f)
      {:name => f.sub('public/', '/'), :desc => "相片"} if basename.include?('photo')
    end.compact
    flash[:notic] = '主人还未上传相片' if @files.blank?
    render :layout=>'photo'
  end
end
