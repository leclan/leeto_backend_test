# frozen_string_literal: true

# Represent the base model.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
