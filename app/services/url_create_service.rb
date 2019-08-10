class UrlCreateService
  def initialize(params)
    @original_url = params.fetch(:original_url)
  end

  def perform
    url = Url.create(
      original_url: original_url,
      shortened_url: SecureRandom.base58(6)
    )

    crawls_title(url.id)

    url
  end

  private
  attr_reader :original_url

  def crawls_title(url_id)
    UrlCrawlerWorker.perform_async(url_id)
  end
end
