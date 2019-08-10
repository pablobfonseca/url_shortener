require 'rails_helper'

feature 'When I insert' do
  context 'a valid url' do
    scenario 'I receive back the url shortened' do
      visit root_path

      expect {
        fill_in "url_form_original_url", with: "https://google.com"
        click_button "Shorten"
      }.to change(Url, :count)
      
    end
  end

  context 'a invalid URL' do
    scenario 'I should receive an error message' do
      visit root_path

      expect {
        fill_in "url_form_original_url", with: "foo"
        click_button "Shorten"
      }.not_to change(Url, :count)

      expect(page).to have_content(/not a valid URL/)
    end
  end
end
