
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'is a class' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    # binding.pry
    expect(cards).to be_a(CardGenerator)
  end

  it 'is a class' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    binding.pry
    expect(cards).to eq(cards)
  end



end
