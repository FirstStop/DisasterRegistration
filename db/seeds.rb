# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Person.create!(id: '000000000000000000000001', first_name: 'RHoK', last_name: 'Dude', nickname: 'Rocky', speciality: 'Doing good', email: 'RHoK@example.com.au', current_contact_phone: '041234')

registration_wizard = Wizard::Wizard.new(content: [
                                             Wizard::WizardNode.new(name: 'wizard.welcome', content: [
                                                                                            Wizard::Headline.new(text: "Hello, nice to meet you."),
                                                                                            Wizard::Paragraph.new(text: "Before you start doing something good for the world @ RHoK, please register your details with us. We will print your very own name tag for this weekend! If you want to connect with others, simply scan the QR code on their name tag and add them to your contacts."),
                                                                                            Wizard::NextButton.new(target: 'wizard.basic_information', label: 'Start my registration')
                                                                                        ]),

                                             Wizard::WizardNode.new(name: 'wizard.basic_information', content: [
                                                                                                      Wizard::Headline.new(text: "Who are you?"),
                                                                                                      Wizard::Split.new(content: [
                                                                                                                            Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: ''),
                                                                                                                            Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '')
                                                                                                                        ]),
                                                                                                      Wizard::Input.new(attribute: "nickname", label: 'How would you like to be called this weekend? (on badge)', placeholder: ''),
                                                                                                      Wizard::Input.new(attribute: "speciality", label: 'What\'s your speciality? (on badge)', placeholder: ''),
                                                                                                      Wizard::NextButton.new(target: 'wizard.contact_details', label: 'Next')
                                                                                                  ]),

                                             Wizard::WizardNode.new(name: 'wizard.contact_details', content: [
                                                                                                    Wizard::Headline.new(text: "What information would you like to share?"),
                                                                                                    Wizard::Paragraph.new(text: "Note: Everybody who scans the QR code on your badge will be able to see these details, so please only enter details that you are happy to share."),
                                                                                                    Wizard::Input.new(attribute: "email", label: 'E-Mail', placeholder: ''),
                                                                                                    Wizard::Input.new(attribute: "current_contact_phone", label: 'Phone number', placeholder: ''),
                                                                                                    Wizard::SubmitButton.new(target: 'wizard.register', label: 'Register')
                                                                                                ]),

                                             Wizard::WizardNode.new(name: 'wizard.register', content: [
                                                                                             Wizard::Headline.new(text: "Thank you for your registration"),
                                                                                             Wizard::Paragraph.new(text: "Please collect your name badge from the printing station and start networking with your fellow hackers."),
                                                                                             Wizard::Qr.new(),
                                                                                             Wizard::Link.new(target: '/people/new', label: 'Start over')
                                                                                         ]),
                                         ])
ServiceProvider.create!(name: 'FirstStop RHoK Melbourne', wizard: registration_wizard, workbench: nil, special_role: :registration, person: [])