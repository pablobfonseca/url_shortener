class UrlCrawlerWorker
  include Sidekiq::Worker

  def perform(url_id)
    url = Url.find(url_id)

    UrlCrawlerService.new(url).perform
  end
end
