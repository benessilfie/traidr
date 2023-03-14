require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should have a positive price' do
    product = products.first
    product.price = -1
    refute product.valid?
  end
end
