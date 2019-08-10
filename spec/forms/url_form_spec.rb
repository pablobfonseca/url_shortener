require 'rails_helper'

describe UrlForm do
  it { should respond_to(:original_url) }
  it { should respond_to(:original_url=) }

  context 'validations' do
    it 'should be valid' do
      form = described_class.new(original_url: "https://google.com")

      expect(form.valid?).to be true
    end

    it 'should not be valid' do
      form = described_class.new(original_url: "foo")

      expect(form.valid?).to be false
    end
  end
end
