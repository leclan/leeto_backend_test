# frozen_string_literal: true

class Perk < ApplicationRecord
  belongs_to :organisation

  validates :name,
            presence: true
  validates :maximum_amount, presence: true, numericality: true

  scope :active, -> { where('? BETWEEN start_date AND end_date', Time.current) }
end
