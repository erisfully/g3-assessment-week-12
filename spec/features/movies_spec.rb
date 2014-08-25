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

    expect(page).to have_content 'The Wickerman'
    expect(page).to have_content '2006'
    expect(page).to have_content 'Stuff happens'

    click_on 'Add Movie'
    fill_in 'Name', with: ''
    fill_in 'Year', with: ''
    click_on 'Create Movie'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Year is not a number"

    fill_in 'Name', with: 'Gone in 60 Seconds'
    fill_in 'Year', with: '1999'
    fill_in 'Synopsis', with: 'Stealing cars and such'
    click_on 'Create Movie'

    expect(page).to have_content "The Wickerman (2006) Stuff happens Gone in 60 Seconds (1999) Stealing cars and such"
    expect(page).to_not have_content "Gone in 60 Seconds (1999) Stealing cars and such The Wickerman (2006)"
  end
end