require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = FactoryGirl.create(:person)
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, 
        person: { 
            address: @person.address, 
            current_contact_description: @person.current_contact_description, 
            current_contact_email: @person.current_contact_email, 
            current_contact_name: @person.current_contact_name, 
            current_contact_phone: @person.current_contact_phone, 
            dob: @person.dob, 
            email: @person.email, 
            first_name: @person.first_name, 
            last_name: @person.last_name }, format: :json
    end

    assert_response :success
  end

  test "should show person" do
    get :show, id: @person, format: :json
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, 
      person: { 
        address: @person.address, 
        current_contact_description: @person.current_contact_description, 
        current_contact_email: @person.current_contact_email, 
        current_contact_name: @person.current_contact_name, 
        current_contact_phone: @person.current_contact_phone, 
        dob: @person.dob, 
        email: @person.email, 
        first_name: @person.first_name, 
        last_name: @person.last_name }, format: :json

    assert_response :success
  end
end
