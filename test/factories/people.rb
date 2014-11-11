FactoryGirl.define do
  factory :person do
    first_name "John"
    last_name  "Doe"
    address 'MyString'
    dob 'MyString'
    email 'MyString'
    current_contact_name ''
    current_contact_phone 'MyString'
    current_contact_email 'MyString'
    current_contact_description 'MyString'
  end
end