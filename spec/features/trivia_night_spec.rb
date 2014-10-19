require 'rails_helper'

feature 'Trivia Night' do
  scenario 'User is welcomed on home page' do
    visit '/'
    expect(page).to have_content("Trivia Night!")
  end
end
