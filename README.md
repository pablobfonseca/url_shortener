# URL Shortener
[![Build Status](https://travis-ci.org/pablobfonseca/url_shortener.svg?branch=master)](https://travis-ci.org/pablobfonseca/url_shortener)

## Setup

Requirements:

- Ruby 2.6.3

```shell
git clone https://github.com/pablobfonseca/url_shortener.git
cd url_shortener && bundle install
rails db:setup
rails s
```

### Sidekiq

```shell
bundle exec sidekiq
```

or you can install `foreman` and run both rails and sidekiq with `foreman start`
