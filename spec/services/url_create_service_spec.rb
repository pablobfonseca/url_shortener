require 'rails_helper'

describe UrlCreateService do
  subject { described_class.new(params) }

  describe '#perform' do
    let(:params) { { original_url: "https://google.com" } }

    it 'creates and return the shortened url' do
      url = subject.perform

      expect(url.original_url).to eq "https://google.com"
      expect(url.shortened_url).not_to be_nil
    end

    it 'crawls the url and stores the title' do
      Sidekiq::Testing.inline! do
        url = subject.perform

        expect(url.reload.title).to eq "Google"
      end
    end
  end
end
