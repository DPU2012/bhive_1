require 'test_helper'

class BdatabasesControllerTest < ActionController::TestCase
  setup do
    @bdatabase = bdatabases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bdatabases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bdatabase" do
    assert_difference('Bdatabase.count') do
      post :create, bdatabase: { msg: @bdatabase.msg, mtype: @bdatabase.mtype }
    end

    assert_redirected_to bdatabase_path(assigns(:bdatabase))
  end

  test "should show bdatabase" do
    get :show, id: @bdatabase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bdatabase
    assert_response :success
  end

  test "should update bdatabase" do
    put :update, id: @bdatabase, bdatabase: { msg: @bdatabase.msg, mtype: @bdatabase.mtype }
    assert_redirected_to bdatabase_path(assigns(:bdatabase))
  end

  test "should destroy bdatabase" do
    assert_difference('Bdatabase.count', -1) do
      delete :destroy, id: @bdatabase
    end

    assert_redirected_to bdatabases_path
  end
end
