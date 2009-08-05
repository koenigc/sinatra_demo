Given /^I visit the formular page$/ do
  visit('/form')
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

When /^I press '(.*)'$/ do |name|
  click_button(name)
end

Then /^I should see '(.*)'$/ do |text|
  response_body.should contain(/#{text}/m)
end
