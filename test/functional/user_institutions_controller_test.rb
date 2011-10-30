require 'test_helper'

class UserInstitutionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_institution" do
    assert_difference('UserInstitution.count') do
      post :create, :user_institution => { }
    end

    assert_redirected_to user_institution_path(assigns(:user_institution))
  end

  test "should show user_institution" do
    get :show, :id => user_institutions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_institutions(:one).to_param
    assert_response :success
  end

  test "should update user_institution" do
    put :update, :id => user_institutions(:one).to_param, :user_institution => { }
    assert_redirected_to user_institution_path(assigns(:user_institution))
  end

  test "should destroy user_institution" do
    assert_difference('UserInstitution.count', -1) do
      delete :destroy, :id => user_institutions(:one).to_param
    end

    assert_redirected_to user_institutions_path
  end
end
