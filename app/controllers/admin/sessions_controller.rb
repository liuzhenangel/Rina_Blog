class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new
  end

  def create
    if params[:session][:username] == ENV['pusher_user'] && params[:session][:password] == ENV['pusher_pwd']
      session[:login] = true
      redirect_to admin_posts_path
    else
      flash.now[:error] = '用户名或密码错误'
      render 'new'
    end
  end

  def destroy
    session[:login] = false
    flash[:notic] = '成功退出'
    redirect_to signin_path
  end
end
