class Url < ApplicationRecord
  validates :original_url, url: { no_local: true }
end
