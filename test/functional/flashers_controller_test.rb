require 'test_helper'

class FlashersControllerTest < ActionController::TestCase
  setup do
    @flasher = flashers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flashers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flasher" do
    assert_difference('Flasher.count') do
      post :create, flasher: { name: @flasher.name }
    end

    assert_redirected_to flasher_path(assigns(:flasher))
  end

  test "should show flasher" do
    get :show, id: @flasher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flasher
    assert_response :success
  end

  test "should update flasher" do
    put :update, id: @flasher, flasher: { name: @flasher.name }
    assert_redirected_to flasher_path(assigns(:flasher))
  end

  test "should destroy flasher" do
    assert_difference('Flasher.count', -1) do
      delete :destroy, id: @flasher
    end

    assert_redirected_to flashers_path
  end
end
