require 'rails_helper'

describe UrlCrawlerService do
  describe '#perform' do
    it 'stores the title of a given url' do
      url = Url.create(original_url: "https://google.com")

      stub_request(:get, url.original_url)
        .and_return(status: 200, body: "<title>Google</title>")

      described_class.new(url).perform

      expect(url.title).to eq "Google"
    end

    it 'stores Not Valid as the title when the url is invalid' do
      url = Url.create(original_url: "example.com")

      allow(HTTParty).to receive(:get).with("example.com").and_raise(SocketError)

      described_class.new(url).perform

      expect(url.title).to eq "Not valid"
    end
  end
end
