require 'rails_helper'

describe 'Requesting the shortened url', type: :request do
  describe 'GET /:shortened_url' do
    it 'redirects to the original url' do
      url = Url.create(original_url: 'https://google.com', shortened_url: '123abc')

      get url_path("123abc")

      expect(response).to redirect_to url.original_url
      expect(response).to have_http_status(301)
    end

    it 'returns a message when not found' do
      get url_path("foo")

      expect(response).to have_http_status(404)
      expect(response.body).to render_template(file: "#{Rails.root}/public/404.html")
    end
  end
end
