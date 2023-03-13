class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, raise: false
  include Authenticable
end
