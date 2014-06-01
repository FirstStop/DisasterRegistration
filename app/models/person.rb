class Person < ActiveRecord::Base
  before_create :create_uuid

  def name
    "#{last_name}, #{first_name}"
  end

  private
  def create_uuid
    self.id = SecureRandom.uuid
  end
end
