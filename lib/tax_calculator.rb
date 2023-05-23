# frozen_string_literal: true

require_relative 'tax/basic_tax_calculator'
require_relative 'tax/import_duty_tax_calculator'

class TaxCalculator
  BASIC_TAX = 0.1
  IMPORT_DUTY_TAX = 0.05

  attr_accessor :product

  def initialize(product)
    @product = product
  end

  def calculate_tax
    ((total_tax_amount * 20).ceil / 20.0).round(2)
  end

  private

  def total_tax_amount
    BasicTaxCalculator.calculate(product) + ImportDutyTaxCalculator.calculate(product)
  end
end
