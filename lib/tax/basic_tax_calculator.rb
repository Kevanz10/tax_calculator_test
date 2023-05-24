# frozen_string_literal: true

require_relative 'base_calculator'

class BasicTaxCalculator < BaseCalculator
  BASIC_TAX_RATE = BigDecimal('0.1')

  def self.calculate(product)
    return 0 if product.exempted?

    BigDecimal (product.price * BASIC_TAX_RATE * product.quantity).to_s
  end
end
