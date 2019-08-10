class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end
    
  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to urls_path, notice: "Foo"
    else
      @urls = Url.all
      render :index, notice: @url.errors.full_messages
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
