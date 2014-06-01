class CreatePeopleProviders < ActiveRecord::Migration
  def change
    create_table :people_providers do |t|
      t.belongs_to :person
      t.belongs_to :service_provider
    end
  end
end
