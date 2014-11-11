class WizardController < ApplicationController
  def index

    @model = [

        Wizard::WizardNode.new(id: 'wizard.welcome', content: [
            Wizard::Headline.new(text: "Your FirstStop"),
            Wizard::Paragraph.new(text: "FirstStop enables you to easily share your details with those who can help you."),
            Wizard::Paragraph.new(text: "Registering provides you with a personalised QR Code that allows you to share your details only with those you want to."),
            Wizard::NextButton.new(target: 'wizard.basic_information', text: 'Start my registration')
        ]),

        Wizard::WizardNode.new(id: 'wizard.basic_information', content: [
            Wizard::Headline.new(text: "Who are you?"),
            Wizard::Split.new(content: [
                Wizard::Input.new(id: "first_name", text: 'First name', placeholder: 'First name'),
                Wizard::Input.new(id: "last_name", text: 'Last name', placeholder: 'Last name')
            ]),
            Wizard::Dropdown.new({
                 id: 'sex',
                 text: 'Gender',
                 placeholder: 'Gender',
                 options: {
                   male: 'Male',
                   female: 'Female',
                   other: 'Gender-neutral'
                 }
             }),
            Wizard::Input.new(id: "dob", text: 'Birthday', placeholder: 'xx/xx/xxxx', additional_container_class: 'date'),
            Wizard::NextButton.new(target: 'wizard.address', text: 'Next')
        ]),

        Wizard::WizardNode.new(id: 'wizard.address', content: [
            Wizard::Headline.new(text: "What's your current home address?"),
            Wizard::Input.new(id: "address", text: 'Address', placeholder: 'Address'),
            Wizard::Split.new(content: [
                Wizard::Input.new(id: "suburb", text: 'Suburb', placeholder: 'Suburb'),
                Wizard::Input.new(id: "postcode", text: 'Postcode', placeholder: 'Postcode'),
                Wizard::Input.new(id: "state", text: 'State', placeholder: 'State')
            ]),
            Wizard::NextButton.new(target: 'wizard.contact', text: 'Next')
        ]),


        Wizard::WizardNode.new(id: 'wizard.contact', content: [
            Wizard::Headline.new(text: "How can we contact you?"),
            Wizard::Input.new(id: "email", text: 'Email', placeholder: 'Email', type: 'email'),
            Wizard::Input.new(id: "mobile", text: 'Phone', placeholder: 'Phone', type: 'tel'),
            Wizard::NextButton.new(target: 'wizard.pets', text: 'Next')
        ]),

        Wizard::WizardNode.new(id: 'wizard.pets', content: [
            Wizard::Headline.new(text: "Do you have pets?"),
            Wizard::Buttons.new(content: [
                Wizard::NextButton.new(target: 'wizard.pets2', text: 'yes'),
                Wizard::NextButton.new(target: 'wizard.what_happend', text: 'no')
            ])
        ]),

        Wizard::WizardNode.new(id: 'wizard.pets2', content: [
            Wizard::Headline.new(text: "Tell us about your pets"),
            Wizard::Textarea.new(id: 'pet_details', placeholder: "e.g. names, dog or cat"),
            Wizard::NextButton.new(target: 'wizard.what_happend', text: 'Next')
        ]),

        Wizard::WizardNode.new(id: 'wizard.what_happend', content: [
            Wizard::Headline.new(text: "Tell us your story"),
            Wizard::Textarea.new(id: 'current_situation', placeholder: "Can you share your story and how you have been affected."),
            Wizard::SubmitButton.new(target: 'wizard.qr_code', text: 'Register me')
        ]),

        Wizard::WizardNode.new(id: 'wizard.qr_code', content: [
            Wizard::Headline.new(text: "Thank you for your registration"),
            Wizard::Paragraph.new(text: "Please collect your FirstStop QR code from the printing station and take it with you to the support organisations here to help you."),
            Wizard::Qr.new(),
            Wizard::Link.new(target: '/wizard', text: 'Start over')
        ]),
    ]
  end
end
