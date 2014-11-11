Given(/^I am on the registration page$/) do
  page.visit '/wizard'
end

Then(/^I should see an explanation about FirstStop$/) do
  page.has_selector? 'div[wizard-node="wizard.welcome"] h2'
end

When(/^I select to start my registration$/) do
  page.find('div[wizard-node="wizard.welcome"] button[wizard-next]').click
end

Then(/^I should be asked for my basic information$/) do
  page.find('div[wizard-node="wizard.welcome"] button[wizard-next]').click
  page.find('div[wizard-node="wizard.basic_information"] button[wizard-next]').click
  page.find('div[wizard-node="wizard.address"] button[wizard-next]').click
  page.find('div[wizard-node="wizard.contact"] button[wizard-next]').click
  page.find('div[wizard-node="wizard.pets"] button[wizard-next]', text: 'NO').click
end

When(/^I decide to submit my application$/) do
  page.find('div[wizard-node="wizard.what_happend"] button[wizard-submit]').click
end

Then(/^my data should be captured in the database$/) do
  assert_equal(1, Person.count)
end

And(/^I should see a personalised QR code$/) do
  page.has_selector? 'div[qr-code]'
end