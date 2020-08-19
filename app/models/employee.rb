class Employee < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :organisation

  validates :first_name, presence: true
  validates :last_name, presence: true

  def perks
    organisation
      .perks
      .visible(seniority_in_months)
  end

  def seniority_in_months
    ((Date.current - hire_date).to_f / 365 * 12).round
  end
end
