class Admin::PhotosController < ApplicationController
  layout 'admin'

  def index
    @photos = Photo.photo_album.order(created_at: 'desc').page params[:page]
  end

  def upload
    @photo = Photo.new(image: params['Filedata'], photo_type: true)
    @photo.save!
    render json: {status: 'ok'}
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = '删除成功'
    else
      flash[:error] = '删除失败'
    end
    redirect_to admin_photos_path
  end
end
