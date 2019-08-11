class UrlsController < ApplicationController

  def index
    @form = UrlForm.new
    @urls = Url.all
  end

  def popular
    @urls = Url.popular
  end

  def show
    url = Url.find_by(shortened_url: params[:shortened_url])

    if url.present?
      url.increment!(:accesses)
      redirect_to url.original_url, status: 301
    else
      render_404
    end
  end
    
  def create
    @form = UrlForm.new(url_params)

    if @form.valid?
      @url = UrlCreateService.new(url_params).perform

      render template: 'urls/index'
    else
      @urls = Url.all

      render :index, notice: @form.errors.full_messages
    end
  end

  private

  def url_params
    params.require(:url_form).permit(:original_url)
  end

  def shortened_url(url)
    "#{Rails.configuration.url_app['url']}/#{url.shortened_url}"
  end
end
