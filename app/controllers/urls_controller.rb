class UrlsController < ApplicationController
  def index
    @url = UrlForm.new
    @urls = Url.all
  end
    
  def create
    @url = UrlForm.new(url_params)

    if @url.valid?
      UrlCreateService.new(url_params).perform

      redirect_to urls_path, notice: t('.success')
    else
      @urls = Url.all

      render :index, notice: @url.errors.full_messages
    end
  end

  private

  def url_params
    params.require(:url_form).permit(:original_url)
  end
end
