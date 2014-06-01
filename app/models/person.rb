class Person < ActiveRecord::Base
  before_create :create_uuid
  has_one :authenticable, as: :authenticable_object, autosave: true
  accepts_nested_attributes_for :authenticable;

  def name
    "#{last_name}, #{first_name}"
  end

  private
  def create_uuid
    self.uuid = SecureRandom.uuid
  end
end
