require 'rails_helper'

describe UrlsController, type: :controller do
  describe 'GET #index' do
    it 'assigns a new url' do
      get :index

      expect(assigns(:form)).to be_an_instance_of(UrlForm)
      expect(response).to have_http_status(200)
      expect(subject).to render_template(:index)
    end
  end
    
  describe 'POST #create' do
    it 'creates the url' do
      expect {
        post :create, params: { url_form: { original_url: "https://google.com" } }
      }.to change(Url, :count).from(0).to(1)

      url = Url.last

      expect(assigns(:url)).to eq url
      expect(response).to render_template('urls/_form')
    end
  end
end
