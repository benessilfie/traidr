require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders.first
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test 'should set total' do
    order = Order.new user_id: @order.user_id

    order.products << @product1
    order.products << @product2
    order.save

    assert_equal (@product1.price + @product2.price), order.total
  end
end
