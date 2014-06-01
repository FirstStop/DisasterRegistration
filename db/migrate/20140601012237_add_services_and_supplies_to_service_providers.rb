class AddServicesAndSuppliesToServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :services_supplies, :text
  end
end
