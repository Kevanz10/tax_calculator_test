# frozen_string_literal: true

require_relative 'product'

class ProductFactory
  class << self
    def create_product(input_string)
      product = sanitized_product(input_string)

      imported = product.include?('imported')

      Product.new(
        name: name(product), quantity: quantity(product),
        price: price(product), imported:
      )
    end

    private

    def sanitized_product(input_string)
      input_string.gsub(/\bat\b/, '').gsub(':', '').split(' ')
    end

    def name(product)
      product[1..-2].join(' ')
    end

    def price(product)
      product[-1].to_f
    end

    def quantity(product)
      product[0].to_i
    end
  end
end
