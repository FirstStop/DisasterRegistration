class Person < ActiveRecord::Base
  before_create :create_uuid

  private
  def create_uuid
    self.id = SecureRandom.uuid
  end
end
