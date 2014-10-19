def sign_up(user, password = 'password')
  visit '/'
  click_on 'Sign up'
  within('form') do
    fill_in 'Email', with: user.email
    fill_in 'Username', with: user.username
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
  end
end

def log_in(user, password = 'password')
  visit '/'
  click_on 'Log in'
  within('form') do
    fill_in 'Username', with: user.username
    fill_in 'Password', with: password
    click_on 'Log in'
  end
end
