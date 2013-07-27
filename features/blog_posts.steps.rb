Given(/^there are some blog posts$/) do
  5.times { FactoryGirl.create(:post) }
end

When(/^I visit the blog$/) do
  visit root_path
end

Then(/^I see the blog posts$/) do
  expect(page).to have_content('First post!')
end
