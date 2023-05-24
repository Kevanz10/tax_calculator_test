# frozen_string_literal: true

require_relative 'base_calculator'

class ImportDutyTaxCalculator < BaseCalculator
  IMPORT_DUTY_RATE = BigDecimal('0.05')

  def self.calculate(product)
    return 0 unless product.imported?

    BigDecimal (product.price * IMPORT_DUTY_RATE * product.quantity).to_s
  end
end
