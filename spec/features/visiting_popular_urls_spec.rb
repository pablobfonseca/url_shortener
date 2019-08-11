require 'rails_helper'

feature 'When I visit the top 100 links I should see' do
  background do
    Url.create(title: "Google", original_url: "http://google.com", shortened_url: "http://foo.com/123Gabc", accesses: 10)
    Url.create(title: "Facebook", original_url: "http://facebook.com", shortened_url: "http://foo.com/abcF123", accesses: 5)
    Url.create(title: "Twitter", original_url: "http://twitter.com", shortened_url: "http://foo.com/312Tbac", accesses: 1)
  end

  scenario 'a list ordered by accesses' do
    visit root_path

    click_on "Popular URLs"

    within '.urls > table > tbody' do
      expect(page).to have_css('tr', count: 3)

      expect(page).to have_css('tr:nth-child(1) > td:nth-child(1)', text: 'Google')
      expect(page).to have_css('tr:nth-child(2) > td:nth-child(1)', text: 'Facebook')
      expect(page).to have_css('tr:nth-child(3) > td:nth-child(1)', text: 'Twitter')
    end
  end
end
