class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :dob
      t.string :email
      t.string :current_contact_name
      t.string :current_contact_phone
      t.string :current_contact_email
      t.string :current_contact_description

      t.timestamps
    end
  end
end
