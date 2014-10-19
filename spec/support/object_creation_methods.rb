def create_user(overrides = {})
  User.new({
    :email => 'branwyn@example.com',
    :username => 'Branwyn',
    :password =>'password',
  }.merge(overrides))
end
