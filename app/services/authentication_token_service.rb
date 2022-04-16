class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_ids)
    payload = { user_id: user_ids }

    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end
