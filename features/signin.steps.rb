Given(/^I have an account$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I sign in$/) do
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'theforce'
  click_on 'Sign in'
end

Then(/^I see the dashboard$/) do
  expect(page).to have_content('Welcome back!')
end

Given(/^I am on the dashboard$/) do
  FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in 'Email', with: 'test@new.com'
  fill_in 'Password', with: 'theforce'
  click_on 'Sign in'
end

Then(/^I can create a new post$/) do
  click_on 'Create a new post'
  fill_in 'post_title', with: 'First post!'
  fill_in 'post_content', with: 'Content'
  click_on 'Create'
end

Then(/^I can edit a blog post$/) do
  within('tr#1') do 
    click_on "Edit"
  end
  fill_in 'post_title', with: 'First changed post!'
  fill_in 'post_content', with: 'Different content!'
  click_on 'Update'
  expect(page).to have_content('Different')
end

Then(/^I can delete a blog post$/) do
  within('tr#1') do 
    click_on 'Delete'
  end
  expect(Post.count).to be 4
end
