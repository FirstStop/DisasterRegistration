class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name

      t.date :dob
      t.string :sex
      t.boolean :has_privacy_concerns      

      t.string :mobile
      t.string :temporary_telephone
      t.string :temporary_telephone_description

      t.string :email
      t.string :temporary_email
      t.string :temporary_email_description

      t.string :current_contact_name
      t.string :current_contact_phone
      t.string :current_contact_email
      t.text :current_contact_description


      t.string :injury_description
      t.string :transport
      t.string :house_status

      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode

      t.text :others_at_address
      t.text :pet_details

      t.timestamps
    end
  end
end
