require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(cards)
  end

  it 'is initialized with an array of card objects' do
    expect(@deck).to be_instance_of Deck
  end

  it 'can return the array of cards' do
    expect(@deck.cards).to be_instance_of Array
    @deck.cards.each { |card| expect(card).to be_instance_of Card }
  end

  it 'can return number of cards left in the deck' do
    expect(@deck.count).to be_instance_of Integer
    expect(@deck.count).to be 3
  end
  
  define '#cards_in_category()' do
    it 'can return all the cards from a certain category' do
      expect(@deck.cards_in_category(:Geography)).to be_instance_of Array
      expect(@deck.cards_in_category(:Geography)).to eq [@card_1]
    end

    it 'can return all the cards from a certain category' do
      expect(@deck.cards_in_category(:STEM)).to be_instance_of Array
      expect(@deck.cards_in_category(:STEM)).to eq [@card_2, @card_3]
    end

    it 'returns nil if category is not present in cards array' do
      expect(@deck.cards_in_category(:Movies)).to be_nil
    end
  end
end
