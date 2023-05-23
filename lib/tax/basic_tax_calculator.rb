# frozen_string_literal: true

require_relative 'base_calculator'

class BasicTaxCalculator < BaseCalculator
  BASIC_TAX_RATE = 0.1

  def self.calculate(product)
    product.exempted? ? 0 : (product.price * BASIC_TAX_RATE * product.quantity)
  end
end
