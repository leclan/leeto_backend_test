class Employee < ApplicationRecord
  belongs_to :organisation
  has_many :reimbursement_requests

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :seniority, numericality: { only_integer: true }

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def available_perks
    organisation.perks
  end
end
