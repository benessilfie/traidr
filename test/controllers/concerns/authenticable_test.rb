# frozen_string_literal: true

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

class AuthenticableTest < ActionDispatch::IntegrationTest
  setup { host! 'api.lvh.me' }

  setup do
    @user = users.first
    @authentication = MockController.new
  end

  test 'should get current user from Authorization token' do
    @authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)

    assert_not_nil @authentication.current_user
    assert_equal @user.id, @authentication.current_user.id
  end

  test 'should not get current user from empty or invalid Authorization token' do
    # When token is empty
    @authentication.request.headers['Authorization'] = nil
    assert_nil @authentication.current_user

    # When token is invalid
    @authentication.request.headers['Authorization'] = 'invalid_token'
    assert_raises JWT::DecodeError do
      @authentication.current_user
    end
  end
end
