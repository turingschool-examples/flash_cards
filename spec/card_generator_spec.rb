require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    filename = "./lib/cards.txt"
    @cards = CardGenerator.new(filename).cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'generates the cards into an array to return' do
    expect(@cards.count).to eq(4)
  end
end
