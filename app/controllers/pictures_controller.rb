class PicturesController < ApplicationController
  def index

    @pictures                  = Picture.all
    @most_recent_pictures      = Picture.most_recent_five
    @pictures_from_one_month   = Picture.created_before(1.month.from_now)
    @pictures_from_2018        = Picture.created_before(2018)

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    render text: "Received POST request to '/pictures' with the data URL: #{params}"
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title  = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url    = params[:picture][:url]

    if @picture.save
          redirect_to "/pictures/#{@picture.id}"
        else
          render :edit
        end
    end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

end
