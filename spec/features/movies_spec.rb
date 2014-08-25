require 'rails_helper'
# require 'capybara/rails'
require 'launchy'

feature 'homepage' do
  scenario 'user should see homepage' do
    visit '/'
    expect(page).to have_content 'Cageflix'
    expect(page).to have_content 'Netflix for Nic Cage movies'
  end

  scenario 'user can add a movie' do
    visit '/'
    click_on 'Add Movie'
    fill_in 'Name', with: 'The Wickerman'
    fill_in 'Year', with: '2006'
    fill_in 'Synopsis', with: 'Stuff happens'
    click_on 'Create Movie'
  end
end