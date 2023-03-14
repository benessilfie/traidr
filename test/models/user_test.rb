require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.com', password_digest: 'test1234')
    assert user.valid?
  end

  test 'user with an invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    refute user.valid?
  end

  test 'user with an already existing email should be invalid' do
    other_user = users.first
    user = User.new(email: other_user.email, password_digest: 'test')
    refute user.valid?
  end

  test 'destroy user should destroy associated products' do
    assert_difference 'Product.count', -1 do
      users(:one).destroy
    end
  end
end
