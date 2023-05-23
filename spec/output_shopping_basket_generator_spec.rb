# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/output_shopping_basket_generator'

RSpec.describe OutputShoppingBasketGenerator do
  let(:output1) do
    "2 book: 24.98 \n1 music CD: 16.49 \n1 chocolate bar: 0.85 \nSales Taxes: 1.5\nTotal: 42.32"
  end

  let(:output2) do
    "1 imported box of chocolates: 10.5 \n1 imported bottle of perfume: 54.65 \nSales Taxes: 7.65\nTotal: 65.15"
  end

  let(:output3) do
    "1 imported bottle of perfume: 32.19 \n1 bottle of perfume: 20.89 \n1 packet of headache pills: 9.75 " \
    "\n3 imported boxes of chocolates: 35.45 \nSales Taxes: 7.8\nTotal: 98.28"
  end

  subject { described_class.new(input).call }

  describe '#call' do
    context 'when input 1' do
      let(:input) do
        <<~INPUT
          2 book at 12.49
          1 music CD at 14.99
          1 chocolate bar at 0.85
        INPUT
      end

      it 'generates an output shopping basket' do
        expect(subject).to eq(output1)
      end
    end

    context 'when input 2' do
      let(:input) do
        <<~INPUT
          1 imported box of chocolates at 10.00
          1 imported bottle of perfume at 47.50
        INPUT
      end

      it 'generates an output shopping basket' do
        expect(subject).to eq(output2)
      end
    end

    context 'when input 3' do
      let(:input) do
        <<~INPUT
          1 imported bottle of perfume at 27.99
          1 bottle of perfume at 18.99
          1 packet of headache pills at 9.75
          3 imported boxes of chocolates at 11.25
        INPUT
      end

      it 'generates an output shopping basket' do
        expect(subject).to eq(output3)
      end
    end
  end
end
