require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = FactoryGirl.create(:person)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { address: @person.address, current_contact_description: @person.current_contact_description, current_contact_email: @person.current_contact_email, current_contact_name: @person.current_contact_name, current_contact_phone: @person.current_contact_phone, dob: @person.dob, email: @person.email, first_name: @person.first_name, last_name: @person.last_name }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { address: @person.address, current_contact_description: @person.current_contact_description, current_contact_email: @person.current_contact_email, current_contact_name: @person.current_contact_name, current_contact_phone: @person.current_contact_phone, dob: @person.dob, email: @person.email, first_name: @person.first_name, last_name: @person.last_name }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
