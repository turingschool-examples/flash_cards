require 'rspec'
require './lib/card_generator'
require './lib/card'

describe Card_Generator do
  it 'is initialized properly' do
    filepath = "./cards.txt"
    gen = Card_Generator.new(filepath)
    expect(gen).to be_a(Card_Generator)
  end

  it 'has a working cards reader' do
    filepath = "./cards.txt"
    gen = Card_Generator.new(filepath)
    card_array = [gen.cards[0], gen.cards[1], gen.cards[2], gen.cards[3]]
    expect(gen.cards).to eq(card_array)
  end
end
