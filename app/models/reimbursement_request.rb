class ReimbursementRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :perk
  has_one_attached :receipt

  validates :amount, numericality: { greater_than: 0 }
  validate :below_maximum?
  validate :employee_eligible?

  def employee_eligible?(employee = self.employee)
    return true if perk.employee_eligible?(employee)
    errors.add(:employee, :not_eligible)
  end

  private

  def below_maximum?
    return true if amount && amount <= perk.maximum_amount
    errors.add(:amount, :exceeds_perk_maximum)
  end
end
