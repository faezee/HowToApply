require 'test_helper'

class AppInfosControllerTest < ActionController::TestCase
  setup do
    @app_info = app_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_info" do
    assert_difference('AppInfo.count') do
      post :create, app_info: { acc_or_rej: @app_info.acc_or_rej, plan_id: @app_info.plan_id, professer_id: @app_info.professer_id, profile_id: @app_info.profile_id }
    end

    assert_redirected_to app_info_path(assigns(:app_info))
  end

  test "should show app_info" do
    get :show, id: @app_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_info
    assert_response :success
  end

  test "should update app_info" do
    patch :update, id: @app_info, app_info: { acc_or_rej: @app_info.acc_or_rej, plan_id: @app_info.plan_id, professer_id: @app_info.professer_id, profile_id: @app_info.profile_id }
    assert_redirected_to app_info_path(assigns(:app_info))
  end

  test "should destroy app_info" do
    assert_difference('AppInfo.count', -1) do
      delete :destroy, id: @app_info
    end

    assert_redirected_to app_infos_path
  end
end
