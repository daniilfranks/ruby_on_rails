def login_user
  visit login_path
  fill_in 'user_email', with: 'danila_babanov@yahoo.com'
  fill_in 'user_password', with: '123456'
  click_on 'Log in'
end