# frozen_string_literal: true

require_relative 'base_calculator'

class ImportDutyTaxCalculator < BaseCalculator
  IMPORT_DUTY_RATE = 0.05

  def self.calculate(product)
    product.imported? ? (product.price * IMPORT_DUTY_RATE * product.quantity) : 0
  end
end
