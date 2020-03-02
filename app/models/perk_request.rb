class PerkRequest < ApplicationRecord
  belongs_to :user
  belongs_to :perk

  validates :amount, presence: true

  has_one_attached :receipt

  def get_available_amount
    PerkRequest.where(
      'perk_requests.user_id = ? AND perk_requests.perk_id = ?',
      self.user_id, self.perk_id
    ).sum(:amount)
  end
end
