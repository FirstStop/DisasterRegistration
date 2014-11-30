class Person
    include MongoMapper::Document

    include PublicActivity::Model
    tracked

    key :uuid, String

    before_create :create_uuid
    timestamps!

    def new(args)
      args.each do |key | value|
        self[key] = value
      end
    end


    #todo re-think about this, in context of variable attributes
  def v_card
    <<-eos
BEGIN:VCARD
VERSION:2.1
N:#{self[:first_name]};#{self[:last_name]}
UID:urn:uuid:#{self[:uuid]}
TEL;HOME;voice:#{self[:current_contact_phone]}
ADR:;;#{self[:address]};#{self[:suburb]};#{self[:state]};#{self[:postcode]}
EMAIL:#{self[:email]}
END:VCARD
    eos
  end


  private
  def create_uuid
    self.uuid = SecureRandom.uuid unless self.uuid
  end
  
end
