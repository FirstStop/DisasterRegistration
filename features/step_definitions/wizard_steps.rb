Given(/^I am on the registration page$/) do
  page.visit '/people/new'
end

Then(/^I should see an explanation about FirstStop$/) do
  page.has_selector? 'div[wizard-node="wizard.step1"] h2'
end

When(/^I select to start my registration$/) do
  page.find('div[wizard-node="wizard.step1"] button[wizard-next]').click
end

Then(/^I should be asked for my basic information$/) do |table|
  values = table.rows_hash
  fill_in 'input2-1', :with => values['input2-1']
  fill_in 'input2-2', :with => values['input2-2']
  page.find('div[wizard-node="wizard.step2"] button[wizard-next]').click
  fill_in 'input3-1', :with => values['input3-1']
  fill_in 'input3-2', :with => values['input3-2']
end

When(/^I decide to submit my application$/) do
  page.find('div[wizard-node="wizard.step3"] button[wizard-submit]').click
end

Then(/^my data should be captured in the database$/) do |table|
  assert_equal(1, Person.count)

  person = Person.first
  person_data_extract = [['Attribute', 'Value']]
  table.rows_hash.each do |key, name|
    person_data_extract << [key, person[key]] unless key == 'Attribute'
  end
  table.dup.diff! person_data_extract
end

And(/^I should see a personalised QR code$/) do
  page.has_selector? 'div[qr-code]'
end

Given(/^a basic registration wizard is defined$/) do
  registration_wizard = Wizard::Wizard.new(content: [
     Wizard::WizardNode.new(name: 'wizard.step1', content: [
        Wizard::Headline.new(text: "Step 1"),
        Wizard::NextButton.new(target: 'wizard.step2', label: 'Start my registration')
    ]),

     Wizard::WizardNode.new(name: 'wizard.step2', content: [
          Wizard::Headline.new(text: "Step 2"),
          Wizard::Input.new(attribute: "input2-1", label: 'Input2 - 1', placeholder: ''),
          Wizard::Input.new(attribute: "input2-2", label: 'Input2 - 2', placeholder: ''),
          Wizard::NextButton.new(target: 'wizard.step3', label: 'Next')
      ]),

     Wizard::WizardNode.new(name: 'wizard.step3', content: [
          Wizard::Headline.new(text: "Step 3"),
          Wizard::Input.new(attribute: "input3-1", label: 'Input3 - 1', placeholder: ''),
          Wizard::Input.new(attribute: "input3-2", label: 'Input3 - 2', placeholder: ''),
          Wizard::SubmitButton.new(target: 'wizard.step4', label: 'Register')
      ]),

     Wizard::WizardNode.new(name: 'wizard.step4', content: [
         Wizard::Headline.new(text: "Done"),
     ]),
 ])
  ServiceProvider.create!(name: 'FirstStop', wizard: registration_wizard, special_role: :registration)
end