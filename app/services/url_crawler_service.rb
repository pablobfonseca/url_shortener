class UrlCrawlerService
  def initialize(url)
    @url = url
  end

  def perform
    url.update(title: get_title)
  end


  private
  attr_reader :url

  def get_title
    document = HTTParty.get(url.original_url)
    parsed_document = Nokogiri::HTML(document.body)

    parsed_document.search('title').text
  end
end
