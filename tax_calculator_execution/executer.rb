#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/output_shopping_basket_generator'

if ARGV[0].nil?
  puts 'Missing Input number information, please provide a valid number.'
else
  begin
    client = OutputShoppingBasketGenerator.new(ARGV[0].to_i)
    print client.call
  rescue ArgumentError => e
    puts "Invalid input number: #{e.message}"
  rescue StandardError => e
    puts "Error occurred: #{e.message}"
  end
end
