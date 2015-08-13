class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.save
    render json: @image
  end

  def index
    @images = Image.all
    render json: @images
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  private
  def image_params
    params.require(:image).permit(:url, :thumbnail_url, :width, :height)
  end
end
