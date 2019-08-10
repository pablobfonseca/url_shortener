module ApplicationHelper
  def shortened_url(url)
    return unless url

    complete_url = "#{Rails.configuration.url_app['url']}/#{url.shortened_url}"
    link_to complete_url, complete_url, target: "_blank"
  end
end
