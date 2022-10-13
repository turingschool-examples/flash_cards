require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

  it 'has an array of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  describe '#count' do
    it 'counts the number of cards in a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'returns the card in the corresponding category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
      expect(deck.cards_in_category(:Sports)).to eq([])
    end
  end
  #how will I do this when pry expected result is something
  #like pry(main)> deck.cards_in_category(:STEM)
  #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]

  #rspec
  #expected: #<Card:0x00007fd51b8cbe58
  #@question="What is the capital of Alaska?", @answer="Juneau",
  # @category=:Geography>
  #got: nil
end
