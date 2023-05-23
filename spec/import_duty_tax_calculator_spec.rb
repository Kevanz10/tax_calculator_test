# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/tax/import_duty_tax_calculator'
require_relative '../lib/product'

RSpec.describe ImportDutyTaxCalculator do
  describe '.calculate' do
    let(:product) { Product.new(name: 'test', quantity: 1, imported:, price: 10) }
    let(:subject) { described_class.calculate(product) }

    context 'when product is imported' do
      let(:imported) { true }

      it 'multiplies the price by quantity plus the import duty rate' do
        expect(subject).to eq(product.price * 0.05 * product.quantity)
      end
    end

    context 'when product is not imported' do
      let(:imported) { false }

      it 'returns zero' do
        expect(subject).to eq(0)
      end
    end
  end
end
