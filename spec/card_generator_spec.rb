# frozen_string_literal: true

require './lib/card_generator'

RSpec.describe CardGenerator do
  # Uses before method to repeat code below for each it method
  before(:each) do
    filename = 'cards.txt'
    @generator = CardGenerator.new(filename)
    @cards = @generator.cards
  end

  it 'exists' do
    expect(@generator).to be_instance_of(CardGenerator)
  end
end
