# frozen_string_literal: true

# Represent an organisation.
class Organisation < ApplicationRecord
  has_many :perks

  validates :name,
            presence: true,
            uniqueness: true
end
