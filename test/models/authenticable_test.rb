require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "create and match_password" do
     authenticable = Authenticable.new
     authenticable.username = "TestUser"
     authenticable.password = "TestPassword"
     authenticable.save!
     authenticable.reload

    assert(authenticable.match_password("TestPassword"))

     assert(Authenticable.authenticate("TestUser", "TestPassword"))
  end

end
