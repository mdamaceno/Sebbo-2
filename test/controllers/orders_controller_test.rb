require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { created_by: @order.created_by, deactivated_by: @order.deactivated_by, delivery_city: @order.delivery_city, delivery_field1: @order.delivery_field1, delivery_field2: @order.delivery_field2, delivery_field3: @order.delivery_field3, delivery_field4: @order.delivery_field4, delivery_state: @order.delivery_state, freight_price: @order.freight_price, freight_type: @order.freight_type, payment_method: @order.payment_method, status: @order.status, updated_by: @order.updated_by }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { created_by: @order.created_by, deactivated_by: @order.deactivated_by, delivery_city: @order.delivery_city, delivery_field1: @order.delivery_field1, delivery_field2: @order.delivery_field2, delivery_field3: @order.delivery_field3, delivery_field4: @order.delivery_field4, delivery_state: @order.delivery_state, freight_price: @order.freight_price, freight_type: @order.freight_type, payment_method: @order.payment_method, status: @order.status, updated_by: @order.updated_by }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
