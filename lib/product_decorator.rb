# frozen_string_literal: true

class ProductDecorator
  attr_accessor :product

  def initialize(product)
    @product = product
  end

  def total
    ((product.quantity * product.price) + tax).round(2)
  end

  def description
    "#{product.quantity} #{product.name}: #{total} \n"
  end

  def tax
    @tax ||= TaxCalculator.new(product).calculate_tax
  end
end
