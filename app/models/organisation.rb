# frozen_string_literal: true

class Organisation < ApplicationRecord
  has_many :employees
  has_many :perks

  validates :name, presence: true, uniqueness: true
end
