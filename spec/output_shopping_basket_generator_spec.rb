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

  subject { described_class.new(input_number).call }

  describe '#call' do
    context 'when input number is 1' do
      let(:input_number) { 1 }

      it 'generates an output shopping basket' do
        expect(subject).to eq(output1)
      end
    end

    context 'when input number is 2' do
      let(:input_number) { 2 }

      it 'generates an output shopping basket' do
        expect(subject).to eq(output2)
      end
    end

    context 'when input number is' do
      let(:input_number) { 3 }

      it 'generates an output shopping basket' do
        expect(subject).to eq(output3)
      end
    end

    context 'when invalid input number' do
      let(:input_number) { 4 }

      it 'returns an InvalidInputNumberError' do
        expect { subject }.to raise_error(Data::InvalidInputNumberError, 'Invalid input number: 4')
      end
    end
  end
end
