require 'test_helper'

class UserActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_activity" do
    assert_difference('UserActivity.count') do
      post :create, :user_activity => { }
    end

    assert_redirected_to user_activity_path(assigns(:user_activity))
  end

  test "should show user_activity" do
    get :show, :id => user_activities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_activities(:one).to_param
    assert_response :success
  end

  test "should update user_activity" do
    put :update, :id => user_activities(:one).to_param, :user_activity => { }
    assert_redirected_to user_activity_path(assigns(:user_activity))
  end

  test "should destroy user_activity" do
    assert_difference('UserActivity.count', -1) do
      delete :destroy, :id => user_activities(:one).to_param
    end

    assert_redirected_to user_activities_path
  end
end
