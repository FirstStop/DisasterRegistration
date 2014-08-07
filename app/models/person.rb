class Person < ActiveRecord::Base
  before_create :create_uuid
  has_one :authenticable, as: :authenticable_object, autosave: true
  accepts_nested_attributes_for :authenticable;

  def name
    "#{last_name}, #{first_name}"
  end

  def accessible_for_user authenticable
    if authenticable.try(:authenticable_object).nil?
      true
    elsif authenticable.authenticable_object is_a? Person.class
      authenticable.authenticable_object == self
    elsif authenticable.authenticable_object is_a? ServiceProvider.class
      authenticable.authenticable_object.clients.include? self
    end
  end

  private
  def create_uuid
    self.uuid = SecureRandom.uuid
  end
end
