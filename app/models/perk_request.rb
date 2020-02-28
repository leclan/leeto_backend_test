class PerkRequest < ApplicationRecord
  belongs_to :user
  belongs_to :perk

  has_one_attached :receipt
end
