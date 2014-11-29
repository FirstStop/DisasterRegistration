
class Person
    include MongoMapper::Document

    include PublicActivity::Model
    tracked

    key :first_name, String
    key :last_name, String
    key :dob, Date
    key :sex, String
    key :has_privacy_concerns, Boolean
    key :mobile, String
    key :email, String
    key :current_contact_name, String
    key :current_contact_phone, String
    key :current_contact_email, String
    key :current_contact_description, String
    key :injury_description, String
    key :transport, String
    key :house_status, String
    key :address, String
    key :suburb, String
    key :state, String
    key :postcode, String
    key :others_at_address, String
    key :pet_details, String
    key :current_situation, String
    key :uuid, String

    key :avatar, String
    key :fun_fact, String
    key :super_power, String
    key :speciality, String
    key :nickname, String

    before_create :create_uuid
    timestamps!
 
  def name
    "#{last_name}, #{first_name}"
  end

  def v_card
    <<-eos
BEGIN:VCARD
VERSION:2.1
N:#{first_name};#{last_name}
UID:urn:uuid:#{uuid}
TEL;HOME;voice:#{current_contact_phone}
ADR:;;#{address};#{suburb};#{state};#{postcode}
EMAIL:#{email}
END:VCARD
    eos
  end


  private
  def create_uuid
    self.uuid = SecureRandom.uuid unless self.uuid
  end
  
end
