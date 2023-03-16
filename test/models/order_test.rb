require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders.first
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test 'should set total' do
    @order.placements = [
      Placement.new(product_id: @product1.id, quantity: 3),
      Placement.new(product_id: @product2.id, quantity: 2)
    ]

    @order.set_total!
    expected_total = @product1.price * 3 + @product2.price * 2

    assert_equal expected_total, @order.total
  end

  test 'builds 2 placements for the order' do
    @order.build_placements_with_product_ids_and_quantities([{ product_id: @product1.id, quantity: 3 },
                                                             { product_id: @product2.id, quantity: 2 }])
    assert_difference 'Placement.count', 2 do
      @order.save
    end
  end

  test 'an order should not be created if a placement quantity is more than the available product quantity' do
    @order.placements << Placement.new(product_id: @product1.id, quantity: (@product1.quantity + 1))

    refute @order.valid?
  end
end
