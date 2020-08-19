class Employee < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :organisation

  validates :first_name, presence: true
  validates :last_name, presence: true

  def perks
    organisation.perks.active
  end
end
