require 'rails_helper'

describe UrlCrawlerService do
  describe '#perform' do
    it 'stores the title of a given url' do
      url = Url.create(original_url: "https://google.com")

      described_class.new(url).perform

      expect(url.title).to eq "Google"
    end
  end
end
