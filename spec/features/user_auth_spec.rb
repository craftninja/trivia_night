require 'rails_helper'

feature 'User Auth' do

  scenario 'User can register' do
    username = 'Branwyn'
    welcome_message = "Welcome to Trivia Night, #{username}"
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'branwyn@example.com'
    fill_in 'Username', with: 'Branwyn'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within("form") do
      click_on 'Sign up'
    end
    expect(page).to have_content welcome_message
  end

  scenario 'User can logout' do
    username = 'Branwyn'
    welcome_message = "Welcome to Trivia Night, #{username}"
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'branwyn@example.com'
    fill_in 'Username', with: username
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    within("form") do
      click_on 'Sign up'
    end
    expect(page).to have_content(welcome_message)
    click_on 'Log out'
    expect(page).to_not have_content(welcome_message)
  end

  scenario 'User can login with registered username and password' do
    pending
    username = 'Branwyn'
    password = 'password'
    welcome_message = "Welcome to Trivia Night, #{username}"
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'branwyn@example.com'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    within("form") do
      click_on 'Sign up'
    end
    click_on 'Log out'
    click_on 'Log in'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content(welcome_message)
  end

  scenario 'User cannot login if their username does not exist' do
    pending
    username = 'Branwyn'
    password = '123456'
    visit '/'
    click_on 'Log in'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content 'Username / password is invalid'
  end

  scenario 'User cannot sign in with an invalid username and/or password' do
    pending
    username = 'Branwyn'
    password = '123456'
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'branwyn@example.com'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    within("form") do
      click_on 'Sign up'
    end
    click_on 'Log out'
    click_on 'Log in'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content 'Username / password is invalid'
  end
end
