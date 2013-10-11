module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :set_token
  end

  protected
  def set_token
    self.token = loop do
      token = SecureRandom.urlsafe_base64(Settings.security.token_length, false)
      break token unless Event.exists?(token: token)
    end
  end
end
