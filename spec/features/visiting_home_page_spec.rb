require 'rails_helper'

feature 'Visiting the home page' do
  scenario 'I should be able to see a text input' do
    visit root_path

    expect(page).to have_css("input", count: 1)
  end
end
