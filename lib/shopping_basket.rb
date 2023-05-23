# frozen_string_literal: true

require_relative 'tax_calculator'
require_relative 'product_factory'
require_relative 'product_decorator'
require 'byebug'
class ShoppingBasket
  attr_reader :products

  def initialize
    @products = []
  end

  def add_product(product)
    @products << ProductDecorator.new(product)
  end

  def total
    calculate_value(:total)
  end

  def sales_taxes
    calculate_value(:tax)
  end

  private

  def calculate_value(field)
    @products.sum { |product| product.send(field) }.round(2)
  end
end
