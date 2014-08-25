require 'rails_helper'
# require 'capybara/rails'
require 'launchy'

feature 'homepage' do
  scenario 'user should see homepage' do
    visit '/'
    expect(page).to have_content 'Cageflix'
    expect(page).to have_content 'Netflix for Nic Cage movies'
  end
end