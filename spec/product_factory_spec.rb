# frozen_string_literal: true

require_relative '../lib/product_factory'
require_relative '../lib/product'

RSpec.describe ProductFactory do
  describe '.create_product' do
    let(:created_product) { described_class.create_product(input_product) }

    context 'given a input string' do
      context 'regular product' do
        let(:input_product) { '2 book at 12.49' }
        let(:expected_product) do
          { name: 'book', quantity: 2, price: 12.49, imported: false }
        end

        it 'creates a not imported product' do
          expect(created_product).to have_attributes(expected_product)
          expect(created_product.exempted?).to be_truthy
        end
      end

      context 'imported product' do
        let(:input_product) { '2 imported bottle of perfume: 54.65' }

        let(:expected_product) do
          { name: 'imported bottle of perfume', quantity: 2, price: 54.65, imported: true }
        end

        it 'creates an imported product' do
          expect(created_product).to have_attributes(expected_product)
          expect(created_product.exempted?).to be_falsey
        end
      end
    end
  end
end
