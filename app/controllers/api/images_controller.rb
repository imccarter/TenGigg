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

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def image_params
    params.require(:image).permit(:url, :thumbnail_url, :width, :height)
  end
end
