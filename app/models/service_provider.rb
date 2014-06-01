class ServiceProvider < ActiveRecord::Base
  has_and_belongs_to_many :clients, :class_name => "Person", :join_table => "people_providers"
end
