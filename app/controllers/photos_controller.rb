class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photo_path(@photo)
  end

  def show
  end

  def edit
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :detail, :image, :spot, :address_city, :address_street, :prefecture)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
