require './lib/deck'
require './lib/card'

RSpec.describe Deck do

  before(:all) do
    @test_cards = [
      Card.new("What is the capital of Alaska?", "Juneau", :Geography),
      Card.new("When did world war 2 end?", "Sep 2, 1945", :History),
      Card.new("What is the square root of 25?", "5", :Math),
      Card.new("What is the square root of 144?", "12", :Math)
    ]
  end

  it 'exists' do
    test_deck = Deck.new(@test_cards)
    expect(test_deck).to be_instance_of(Deck)
  end

  it 'returns the number of cards via count' do
    test_deck = Deck.new(@test_cards)
    expect(test_deck.count).to eq(4)
  end

  it 'returns the cards for a given category' do
    test_deck = Deck.new(@test_cards)

    cards = test_deck.cards_in_category(:Math)

    expect(cards.length).to eq(2)

    cards.each {|card|
      expect(card.category).to eq(:Math)
    }
  end


end
