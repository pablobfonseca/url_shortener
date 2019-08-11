require 'rails_helper'

describe Url, type: :model do
  describe '.popular' do
    it 'orders by the most accessed urls' do
      url1 = Url.create(original_url: "http://google.com", accesses: 10)
      url2 = Url.create(original_url: "http://facebook.com", accesses: 5)
      url3 = Url.create(original_url: "http://twitter.com", accesses: 3)

      expect(described_class.popular).to eq [url1, url2, url3]
    end
  end
end
