require 'test_helper'

class SubmenusControllerTest < ActionController::TestCase
  setup do
    @submenu = submenus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submenus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submenu" do
    assert_difference('Submenu.count') do
      post :create, submenu: { active: @submenu.active, created_by: @submenu.created_by, deactivated_by: @submenu.deactivated_by, menu_id: @submenu.menu_id, name: @submenu.name, route: @submenu.route, updated_by: @submenu.updated_by }
    end

    assert_redirected_to submenu_path(assigns(:submenu))
  end

  test "should show submenu" do
    get :show, id: @submenu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submenu
    assert_response :success
  end

  test "should update submenu" do
    patch :update, id: @submenu, submenu: { active: @submenu.active, created_by: @submenu.created_by, deactivated_by: @submenu.deactivated_by, menu_id: @submenu.menu_id, name: @submenu.name, route: @submenu.route, updated_by: @submenu.updated_by }
    assert_redirected_to submenu_path(assigns(:submenu))
  end

  test "should destroy submenu" do
    assert_difference('Submenu.count', -1) do
      delete :destroy, id: @submenu
    end

    assert_redirected_to submenus_path
  end
end
