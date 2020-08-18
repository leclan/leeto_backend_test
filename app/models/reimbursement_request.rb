# frozen_string_literal: true

class ReimbursementRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :perk

  validates :amount, presence: true, numericality: true
  validate :amount_cannot_be_superior_to_perk_amount

  private

  def amount_cannot_be_superior_to_perk_amount
    if amount.present? && amount > perk.maximum_amount
      errors.add(:amount, "can't be superior to #{perk.maximum_amount}")
    end
  end
end
