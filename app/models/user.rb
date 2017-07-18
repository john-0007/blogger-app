class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  before_create :generate_confirmation_token

  def generate_confirmation_token
  self.confirmation_token = SecureRandom.hex

  end

  def confirmed?
    self.confirmed_at.present?
  end
end
