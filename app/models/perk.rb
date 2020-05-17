class Perk < ApplicationRecord
  belongs_to :organisation

  validates :name, presence: true, uniqueness: true
  validates :maximum_amount, numericality: { greater_than: 0 }

  def employee_eligible?(employee)
    perk_rules.all? { |rule| rule.evaluate(employee) }
  end

  def perk_rules
    @perk_rules ||= []
    return @perk_rules if @perk_rules.present? || self.rules.empty?
    @perk_rules = self.rules.map { |rule_hash| PerkRule.new(rule_hash) }
  end
end
