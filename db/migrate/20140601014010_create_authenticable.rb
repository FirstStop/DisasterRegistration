class CreateAuthenticable < ActiveRecord::Migration
  def change
    create_table :authenticables do |t|
      t.string :username
      t.string :encrypted_password
      t.string :salt

      t.string :authenticable_object_type
      t.string :authenticable_object_id
    end
  end
end
