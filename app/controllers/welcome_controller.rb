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
      {:name => f.sub('public/', '/'), :desc => "名称 #{basename.split('.').first}"} if basename.include?('photo')
    end.compact
    render :layout=>'photo'
  end
end
