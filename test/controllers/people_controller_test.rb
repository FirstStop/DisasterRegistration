require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = FactoryGirl.create(:person)
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, 
        person: { 
            field1: 'Field 1',
            field2: 'Field 2',
        }, format: :json
    end

    assert_response :success
  end

  test "should show person" do
    get :show, id: @person, format: :json
    assert_response :success
  end

  test "should update person" do
    patch :update, 
      id: @person, 
      service_provider_id:  FactoryGirl.create(:service_provider).id,
      person: {
          field1: 'Field 1 - Update',
          field2: 'Field 2 - Update',}, format: :json

    assert_response :success
  end
end
