require 'test_helper'

class PageFollowsControllerTest < ActionController::TestCase
  setup do
    @page_follow = page_follows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_follows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_follow" do
    assert_difference('PageFollow.count') do
      post :create, page_follow: { folowee_id: @page_follow.folowee_id, folowee_type: @page_follow.folowee_type, folower_id: @page_follow.folower_id, folower_type: @page_follow.folower_type }
    end

    assert_redirected_to page_follow_path(assigns(:page_follow))
  end

  test "should show page_follow" do
    get :show, id: @page_follow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_follow
    assert_response :success
  end

  test "should update page_follow" do
    patch :update, id: @page_follow, page_follow: { folowee_id: @page_follow.folowee_id, folowee_type: @page_follow.folowee_type, folower_id: @page_follow.folower_id, folower_type: @page_follow.folower_type }
    assert_redirected_to page_follow_path(assigns(:page_follow))
  end

  test "should destroy page_follow" do
    assert_difference('PageFollow.count', -1) do
      delete :destroy, id: @page_follow
    end

    assert_redirected_to page_follows_path
  end
end
