require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'rspec'
require 'pry'

describe CardGenerator do
  it 'exists' do
    filename = './files/cards.txt'
    cards = CardGenerator.new(filename)

    expect(cards).to be_a(CardGenerator)
  end

  it 'can create cards' do
    filename = './files/cards.txt'
    cards = CardGenerator.new(filename)

    expect(cards.cards).to eq([])
  end

end
















# describe CardGenerator do
#   it 'exists' do
#
#   cards = ("./files/cards.txt")
#   card_generator = CardGenerator.new(cards)
#
#   binding.pry
#   expect(card_generator).to be_a(CardGenerator)
#   end
#
#   # it 'can create a card' do
#   #
#   #
#   # expect(card_generator.cards[0]).to be_a(Card)
#   # end
#   #
#
# end
