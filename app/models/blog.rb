class Blog < ApplicationRecord
  has_many :comments
  extend FriendlyId
  friendly_id :title, use: :slugged
end
