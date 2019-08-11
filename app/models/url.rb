class Url < ApplicationRecord
  def self.popular
    order(accesses: :desc).limit(100)
  end
end
