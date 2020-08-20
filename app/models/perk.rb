# frozen_string_literal: true

# Represent a perk.
class Perk < ApplicationRecord
  belongs_to :organisation

  validates :name,
            presence: true
  validates :maximum_amount, presence: true, numericality: true

  scope :active, -> { where('? BETWEEN start_date AND end_date', Time.current) }
  scope :visible, ->(employee_seniority) { active.where('seniority <= ?', employee_seniority) }
end
