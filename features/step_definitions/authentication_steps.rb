Given(/^a user visits the login page$/) do
  visit new_user_session_path
end

When(/^he submits invalid login information$/) do
  click_button 'Login'
end

Then(/^he should see an error message$/) do
  expect(page).to have_selector('div.ui.message.warning')
end

Given(/^the user has an account$/) do
  @user = User.create!({ :email                 => "user@example.com",
                         :password              => 'foobarbatman',
                         :password_confirmation => 'foobarbatman',
                         :username              => 'user' })
end

When(/^the user submits valid login information$/) do
  fill_in "user_login", with: @user.email
  fill_in "user_password", with: @user.password
  click_button "Login"
end

Then(/^he should see a success message$/) do
  expect(page).to have_selector('div.ui.message.info')
end

Then(/^he should see a signout link$/) do
  expect(page).to have_link('Logout', href: destroy_user_session_path)
end