class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new
  end

  def create
    #redirect_to admin_posts_path if session[:login]
    if params[:session][:username] == 'rina' && params[:session][:password] == '112023'
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
