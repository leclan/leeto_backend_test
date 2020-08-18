# frozen_string_literal: true

class ReimbursementRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :perk

  validates :amount, presence: true, numericality: true
end
