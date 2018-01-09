class PicturesController < ApplicationController
  def index
    @picture = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

end
