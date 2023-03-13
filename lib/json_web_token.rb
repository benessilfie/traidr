class JsonWebToken
  SECTRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECTRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECTRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
