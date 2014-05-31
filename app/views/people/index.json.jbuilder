json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :address, :dob, :email, :current_contact_name, :current_contact_phone, :current_contact_email, :current_contact_description
  json.url person_url(person, format: :json)
end
