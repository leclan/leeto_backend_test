class PerkRule
  include ActiveModel::Model

  OPERATOR_MAPPING = { 'lt' => '<', 'gt' => '>' }.freeze

  attr_accessor :operator, :property, :value

  validates :operator, inclusion: { in: %w(lg gt) }
  validates :property, inclusion: { in: %w(seniority) }
  validates :value, presence: true

  def evaluate(employee)
    return false unless employee
    employee_value = employee.send(property)
    return false unless employee_value
    return employee_value.send(OPERATOR_MAPPING[operator], value)
  end
end
