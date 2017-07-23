class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  has_many :comments
  extend FriendlyId
  friendly_id :title, use: :slugged
end
