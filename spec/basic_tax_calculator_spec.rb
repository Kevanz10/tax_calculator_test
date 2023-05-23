# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/tax/basic_tax_calculator'
require_relative '../lib/product'

RSpec.describe BasicTaxCalculator do
  describe '.calculate' do
    let(:product) { Product.new(name:, quantity: 1, imported: true, price: 10) }
    let(:subject) { described_class.calculate(product) }

    context 'when product is exempted' do
      let(:name) { 'book' }

      it 'multiplies the price by quantity plus the basic duty rate' do
        expect(subject).to eq(0)
      end
    end

    context 'when product is not exempted' do
      let(:name) { 'perfume' }

      it 'returns zero' do
        expect(subject).to eq(product.price * 0.1 * product.quantity)
      end
    end
  end
end
