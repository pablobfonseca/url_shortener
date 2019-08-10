class UrlCreateService
  def initialize(params)
    @original_url = params.fetch(:original_url)
  end

  def perform
    return find_url if exists?

    create_url
  end

  private
  attr_reader :original_url

  def create_url
    url = Url.create(
      original_url: original_url,
      shortened_url: SecureRandom.base58(6)
    )

    crawls_title(url.id)

    url
  end

  def exists?
    Url.exists?(original_url: original_url)
  end

  def find_url
    Url.find_by(original_url: original_url)
  end

  def crawls_title(url_id)
    UrlCrawlerWorker.perform_async(url_id)
  end
end
