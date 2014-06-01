class ServiceProvider < ActiveRecord::Base
  has_and_belongs_to_many :clients, :class_name => "Person", :join_table => "people_providers"
  
  has_one :authenticable, as: :authenticable_object, autosave: true
  accepts_nested_attributes_for :authenticable;
end
