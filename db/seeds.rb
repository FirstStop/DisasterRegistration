# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Person.create!(
  id: '000000000000000000000001',

  first_name: 'RHoK',
  last_name: 'Star',
  email: 'RHoK@example.com.au',
  phone: '0456 789 123',

  nickname: 'Registration',
  capability: 'Desksitter',
  speciality: 'Thanks for coming!',

  dinner: 'No',
  diet: '',

  age_group: nil,
  gender: '',
  company: 'RHoK',
  referrer: 'Been before'
)

def personal_details(next_button_target)
  Wizard::WizardNode.new(
    name: 'wizard.personal_details',
    content: [
      Wizard::Headline.new(text: 'Who are you?'),
      Wizard::Paragraph.new(text: 'This stuff goes into your QR code.'),

      Wizard::Split.new(
        content: [
          Wizard::Input.new(attribute: 'first_name', label: 'First name', placeholder: 'Robert'),
          Wizard::Input.new(attribute: 'last_name', label: 'Last name', placeholder: 'Dobolina')
        ]
      ),
      Wizard::Input.new(attribute: 'email', label: 'E-Mail', placeholder: 'you@email.com'),
      Wizard::Input.new(attribute: 'phone', label: 'Phone number', placeholder: '0456 789 123'),

      Wizard::NextButton.new(target: next_button_target, label: 'Next')
    ]
  )
end

def badge_details(next_button_target)
  Wizard::WizardNode.new(
    name: 'wizard.badge_details',
    content: [
      Wizard::Headline.new(text: 'Badge Details'),
      Wizard::Paragraph.new(text: 'This stuff is printed on your badge.'),

      Wizard::Input.new(attribute: 'nickname', label: 'Display name (or nickname)', placeholder: 'Bob'),
      Wizard::Input.new(attribute: 'capability', label: 'What skillset or capability are you bringing to this event?', placeholder: 'Problem Owner, or BA, or UX, or QA, or Dev, or something?'),
      Wizard::Input.new(attribute: 'speciality', label: 'From that role, what is your speciality?', placeholder: 'Drawing boxes and lines, Node.js, etc'),

      Wizard::NextButton.new(target: next_button_target, label: 'Next')
    ]
  )
end

def catering_details(next_button_target)
  Wizard::WizardNode.new(
    name: 'wizard.catering_details',
    content: [
      Wizard::Headline.new(text: 'Are you eating?'),
      Wizard::Paragraph.new(text: 'Please help us out with catering info.'),

      Wizard::Input.new(attribute: 'dinner', label: 'Are you staying for dinner?', placeholder: 'Yes, please!'),
      Wizard::Input.new(attribute: 'diet', label: 'Dietary requirements (this is most important for "yes" and "maybe")', placeholder: 'Halal, vegan, Kosher, fructose malabsorption, lactose intolerant, allergic to nuts, eggs, fun, water, etc'),

      Wizard::NextButton.new(target: next_button_target, label: 'Next')
    ]
  )
end

def demographic_details(next_button_target)
  Wizard::WizardNode.new(
    name: 'wizard.demographic_details',
    content: [
      Wizard::Headline.new(text: 'Extra information'),
      Wizard::Paragraph.new(text: 'This stuff is optional, but very interesting~*'),

      Wizard::Dropdown.new(
        id: 'age_group',
        text: 'Age group',
        options: {
          under_20: 'Under 20',
          '20s' => '20s',
          '30s' => '30s',
          '40s' => '40s',
          '50s' => '50s',
          '60s' => '60s',
          '70s' => '70s',
          over_70s: '80 and Up',
          no_answer: 'I\'d rather not say . . .'
        }
      ),
      Wizard::Input.new(attribute: 'gender', label: 'How do you self-identify?', placeholder: 'Girl, boy, man, woman, combinations, and everything else :)'),
      Wizard::Input.new(attribute: 'company', label: 'Company affiliation?', placeholder: 'REA, MYOB, Swinburne, etc?'),
      Wizard::Input.new(attribute: 'referrer', label: 'How did you find out about RHoK?', placeholder: 'Been before, Meetup, Facebook, Twitter, etc'),

      Wizard::SubmitButton.new(target: next_button_target, label: 'Finish')
    ]
  )
end

registration_wizard = Wizard::Wizard.new(
  content: [
    Wizard::WizardNode.new(
      name: 'wizard.welcome',
      content: [
        Wizard::Headline.new(text: 'Hello, nice to meet you!'),
        Wizard::Paragraph.new(text: 'Thanks for coming! This registration form is mostly to help things run smoothly.'),
        Wizard::Paragraph.new(text: 'We won\'t use your data for marketing or anything . . . we\'re nice people ^_^'),
        Wizard::Paragraph.new(text: 'You\'ll get a badge with a QR code on it. That will contain contact details for people to scan.'),
        Wizard::NextButton.new(target: 'wizard.personal_details', label: 'Start my registration')
      ]
    ),

    personal_details('wizard.badge_details'),
    badge_details('wizard.catering_details'),
    catering_details('wizard.demographic_details'),
    demographic_details('wizard.register'),

    Wizard::WizardNode.new(
      name: 'wizard.register',
      content: [
        Wizard::Headline.new(text: 'All done!'),
        Wizard::Paragraph.new(text: 'Don\'t forget your badge, and have a great weekend!'),
        Wizard::Qr.new(),
        Wizard::Link.new(target: '/people/new', label: 'Start over')
      ]
    )
  ]
)

ServiceProvider.create!(
  name: 'FirstStop RHoK Melbourne',
  wizard: registration_wizard,
  workbench: nil,
  special_role: :registration,
  person: []
)
