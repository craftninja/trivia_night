require 'rails_helper'

feature 'User Auth' do

  let(:password) { 'password'}
  let(:user) { create_user(:password => password) }

  scenario 'User can register' do
    welcome_message = "Welcome to Trivia Night, #{user.username}"
    sign_up(user, password)
    expect(page).to have_content welcome_message
  end

  scenario 'User can logout' do
    welcome_message = "Welcome to Trivia Night, #{user.username}"
    sign_up(user, password)
    expect(page).to have_content(welcome_message)
    click_on 'Log out'
    expect(page).to_not have_content(welcome_message)
  end

  scenario 'User can login with registered username and password' do
    welcome_message = "Welcome to Trivia Night, #{user.username}"
    sign_up(user, password)
    click_on 'Log out'
    log_in(user, password)
    expect(page).to have_content(welcome_message)
  end

  scenario 'User cannot login if their username does not exist' do
    log_in(user)
    expect(page).to have_content 'Username / password is invalid'
  end

  scenario 'User cannot sign in with an invalid password' do
    sign_up(user, password)
    click_on 'Log out'
    log_in(user, 'wrong_password')
    expect(page).to have_content 'Username / password is invalid'
  end
end
