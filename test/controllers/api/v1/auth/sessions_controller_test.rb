require 'test_helper'

class API::V1::Auth::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = users.first }
  setup { host! 'api.lvh.me' }

  test 'should get JWT token' do
    post api_v1_auth_sessions_url, params: { user: { email: @user.email, password: 'password' } }, as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['token']
  end

  test 'should not get JWT token' do
    post api_v1_auth_sessions_url, params: { user: { email: @user.email, password: 'invalid' } }, as: :json
    assert_response :unauthorized
  end
end
