class Perk < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :organisation
end
