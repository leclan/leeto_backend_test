# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReimbursementRequest, type: :model do
  it { should validate_presence_of :amount }
  it { should validate_numericality_of :amount }
end
