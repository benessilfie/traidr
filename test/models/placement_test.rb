require 'test_helper'

class PlacementTest < ActiveSupport::TestCase
  setup { @placement = placements(:one) }

  test 'should decrement product quantity by the placement quantity' do
    product = @placement.product

    assert_difference('product.quantity', -@placement.quantity) do
      @placement.decrement_product_quantity!
    end
  end
end
