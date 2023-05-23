# frozen_string_literal: true

class ShoppingBasketDecorator
  attr_accessor :shopping_basket

  def initialize(shopping_basket)
    @shopping_basket = shopping_basket
  end

  def output
    products + sales_taxes + total
  end

  def products
    shopping_basket.products.map(&:description).join
  end

  def sales_taxes
    "Sales Taxes: #{shopping_basket.sales_taxes}\n"
  end

  def total
    "Total: #{shopping_basket.total}"
  end
end
