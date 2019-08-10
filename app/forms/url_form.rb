class UrlForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :original_url

  validates_url :original_url, no_local: true, allow_blank: false
end
