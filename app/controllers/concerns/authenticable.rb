# frozen_string_literal: true

# This module is responsible for handling authentication
module Authenticable
  def current_user
    return @current_user if @current_user

    token = request.headers['Authorization']&.split&.last
    return nil unless token

    decoded = decode_token
    @current_user ||= User.find(decoded[:user_id])
  end

  def destroy_user_session
    @current_user = nil
  end

  private

  def decode_token
    token = request.headers['Authorization']&.split&.last
    raise JWT::DecodeError, 'No token provided' unless token.present?

    decoded = JsonWebToken.decode(token)

    raise JWT::DecodeError, 'Invalid token' unless decoded.present?
    raise JWT::ExpiredSignature if Time.now.to_i >= decoded[:exp]

    decoded
  end
end
