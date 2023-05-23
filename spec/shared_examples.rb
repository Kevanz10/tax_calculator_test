# frozen_string_literal: true

RSpec.shared_examples 'generates an output shopping basket' do |_input, output|
  it 'generates an output shopping basket' do
    expect(subject).to eq(output)
  end
end
