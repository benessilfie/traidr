require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'should have a positive total' do
    order = orders(:one)
    order.total = -1
    refute order.valid?
  end
end
