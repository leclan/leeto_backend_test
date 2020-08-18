# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Perk, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :maximum_amount }
  it { should validate_numericality_of :maximum_amount }
end
