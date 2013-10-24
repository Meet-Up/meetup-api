module PasswordAuthenticable
  extend ActiveSupport::Concern

  included do
    has_secure_password validations: false
    validates :password, presence: true, length: { minimum: 4 }, on: :create
  end

  def as_json(options={})
    super({ except: :password_digest }.merge(options))
  end

end
