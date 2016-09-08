class Card < ApplicationRecord
  has_one :list

  validates :name, :list_id, presence: true
end
