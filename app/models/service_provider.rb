class ServiceProvider < ActiveRecord::Base
  has_one :authenticable, as: :authenticable_object, autosave: true
  accepts_nested_attributes_for :authenticable;
end
