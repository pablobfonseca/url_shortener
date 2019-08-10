require 'rails_helper'

feature 'When I insert' do
  context 'a valid url' do
    scenario 'I receive back the url shortened' do
      visit root_path

      fill_in "url_original_url", with: "https://google.com"
      click_button "Submit"

      shortened_url = Url.last.shortened_url

      within '.urls' do
        expect(page).to have_content("Top 100 most frequently accessed URLs")
        expect(page).to have_content(shortened_url)
        expect(page).to have_content(shortened_url)
      end
    end
  end

  context 'a invalid URL' do
    scenario 'I should receive an error message' do
      visit root_path

      fill_in "url_original_url", with: "foo"
      click_button "Submit"

      expect(page).to have_content(/not a valid URL/)
    end
  end
end
