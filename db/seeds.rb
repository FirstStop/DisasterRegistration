# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Person.create!(id: '000000000000000000000001', first_name: 'Tony', last_name: 'Donnaldsen', gender: 'Male', address: '14 Greentree Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000002', first_name: 'Liz', last_name: 'Donnaldsen', gender: 'Female', address: '14 Greentree Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000003', first_name: 'Jackie', last_name: 'Ferus', gender: 'Female', address: '23 Yelbon Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000004', first_name: 'Bill Sigismund', last_name: 'Geyar', gender: 'Male', address: '48 Leafie Parade', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000005', first_name: 'Wendy', last_name: 'Geyar', gender: 'Female', address: '48 Leafie Parade', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000006', first_name: 'Dom', last_name: 'Knight', gender: 'Male', address: '11 Barnstorm Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000007', first_name: 'Leena', last_name: 'Lancasta', gender: 'Female', address: '44 Yelbon Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000008', first_name: 'Richard James', last_name: 'Ledgend', gender: 'Male', address: '15 Timberland Close', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000009', first_name: 'Beth', last_name: 'Ledgend', gender: 'Female', address: '15 Timberland Close', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000010', first_name: 'Gordon Princheps', last_name: 'Murphay', gender: 'Male', address: '8 Raglin Street', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000011', first_name: 'John', last_name: 'Pearl', gender: 'Male', address: '42 Puncher Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000012', first_name: 'Carlita', last_name: 'Pearl', gender: 'Female', address: '16 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000013', first_name: 'Tim Fanshaw', last_name: 'Pulver', gender: 'Male', address: '18 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000014', first_name: 'Wayne Ian', last_name: 'Smith', gender: 'Female', address: '20 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000015', first_name: 'Rose', last_name: 'Vine', gender: 'Female', address: '12 Raglin Street', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000016', first_name: 'Andrew George', last_name: 'Waita', gender: 'Male', address: '31 Linklater Avenue', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000017', first_name: 'Jill', last_name: 'Waita', gender: 'Female', address: '31 Linklater Avenue', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000018', first_name: 'Seth', last_name: 'Walkin', gender: 'Male', address: '39 Albury Street', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000019', first_name: 'Jane', last_name: 'Wilsun', gender: 'Female', address: '44 Redgum Close', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000020', first_name: 'Irene', last_name: 'Yung', gender: 'Female', address: '85 Filmore Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')


registration_wizard = Wizard::Wizard.new(content: [
    Wizard::WizardNode.new(name: 'wizard.welcome', content: [
         Wizard::Headline.new(text: "Hello, nice to meet you."),
         Wizard::Paragraph.new(text: "Welcome to RHoK. We are team First Stop and we came together to start making a difference at the June 2014 RHoK. We have made some great progress and would like to use what we have built to help RHoK participants register. This will help us with our testing solution, and iron out any issues prior to using it in the wild."),
         Wizard::Paragraph.new(text: "So, before you start doing something good for the world @ RHoK, please register your details with us. We will print your very own name tag for this weekend! If you want to connect with others, simply scan the QR code on their name tag and add them to your contacts."),
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
ServiceProvider.create!(name: 'FirstStop', wizard: registration_wizard, special_role: :registration)

ServiceProvider.create!(name: 'Australian Red Cross', wizard: registration_wizard, person: Person.all[1..10])
ServiceProvider.create!(name: 'Lions Clubs', person: Person.all[5..15])
ServiceProvider.create!(name: 'The Salvation Army', person: Person.all[10..20])
