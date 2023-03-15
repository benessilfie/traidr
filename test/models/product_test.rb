require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should have a positive price' do
    product = products.first
    product.price = -1
    refute product.valid?
  end

  test 'should filter products by name' do
    assert_equal 2, Product.filter_by_title('harry potter').count
  end

  test 'should filter products by name and sort them' do
    assert_equal [products(:three), products(:one)], Product.filter_by_title('harry potter').sort
  end

  test 'should filter products by price and sort them' do
    assert_equal [products(:three), products(:one)], Product.above_or_equal_to_price(25).sort
  end

  test 'should filter products by price lower and sort them' do
    assert_equal [products(:two)], Product.below_or_equal_to_price(20).sort
  end

  test 'should sort product by most recent' do
    products(:two).touch
    assert_equal [products(:one), products(:three), products(:two)], Product.recent.to_a
  end

  test 'search should not find "purple hibiscus" and "20" as min price' do
    search_hash = { keyword: 'purple hibiscus', min_price: 20 }
    assert Product.search(search_hash).empty?
  end

  test 'should get all products when no parameters are given' do
    assert_equal Product.all.to_a, Product.search({})
  end

  test 'search should filter by product ids' do
    search_hash = { product_ids: [products(:one).id] }
    assert_equal [products(:one)], Product.search(search_hash)
  end
end
