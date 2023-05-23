# frozen_string_literal: true

class Product
  attr_reader :name, :quantity, :price, :imported

  EXEMTED_PRODUCTS = %w[book chocolate pills food medicine].freeze

  def initialize(name:, quantity:, price:, imported:)
    @name = name
    @quantity = quantity
    @price = price
    @imported = imported
  end

  def imported?
    imported
  end

  def exempted?
    EXEMTED_PRODUCTS.any? { |item| name.include?(item) }
  end
end
