class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    redirect_to photo_path(@photo)
  end

  def show
    @comment = Comment.new
    @comments = @photo.comments
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :detail, :image, :spot, :address_city, :address_street, :prefecture)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
