# frozen_string_literal: true

require_relative 'shopping_basket'
require_relative 'product_factory'
require_relative 'shopping_basket_decorator'

class OutputShoppingBasketGenerator
  attr_accessor :input, :shopping_basket

  def initialize(input)
    @input = input
    @shopping_basket = ShoppingBasket.new
  end

  def call
    run
    generate
  end

  private

  def run
    input.each_line do |line|
      shopping_basket.add_product(ProductFactory.create_product(line))
    end
  end

  def generate
    ShoppingBasketDecorator.new(@shopping_basket).output
  end
end
