require 'test_helper'

class ProfessersControllerTest < ActionController::TestCase
  setup do
    @professer = professers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professer" do
    assert_difference('Professer.count') do
      post :create, professer: { name: @professer.name, uni_id: @professer.uni_id }
    end

    assert_redirected_to professer_path(assigns(:professer))
  end

  test "should show professer" do
    get :show, id: @professer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professer
    assert_response :success
  end

  test "should update professer" do
    patch :update, id: @professer, professer: { name: @professer.name, uni_id: @professer.uni_id }
    assert_redirected_to professer_path(assigns(:professer))
  end

  test "should destroy professer" do
    assert_difference('Professer.count', -1) do
      delete :destroy, id: @professer
    end

    assert_redirected_to professers_path
  end
end
