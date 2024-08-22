require './lib/deck.rb'
require './lib/card.rb'

RSpec.describe Deck do
  it 'exists' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myDeck = Deck.new([myCard])

    expect(myDeck).to be_instance_of(Deck)
  end

  it 'exists with no cards' do
    myDeck = Deck.new([])
  
    expect(myDeck).to be_instance_of(Deck)
  end

  it 'can return count of cards with count = 1' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myDeck = Deck.new([myCard])

    expect(myDeck.count).to eq(1)
  end

  it 'can return count of cards with empty deck' do
    myDeck = Deck.new([])

    expect(myDeck.count).to eq(0)
  end

  it 'can return count of cards with count = 2' do
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    myDeck = Deck.new([myCard1,myCard2,myCard3])

    expect(myDeck.count).to eq(3)
  end

  it 'can return count of cards with category ' do
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [myCard1,myCard2,myCard3]
    myDeck = Deck.new(cards)

    expect(myDeck.cards_in_category(:Geography)).to eq(1)
  end

  it 'can return count of cards with category when there are multiple' do
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    myCard4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    cards = [myCard1,myCard2,myCard3,myCard4]
    myDeck = Deck.new(cards)
    
    expect(myDeck.cards_in_category(:Geography)).to eq(2)
  end

  it 'can return count of cards with category when there are none' do
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    myCard4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
    myDeck = Deck.new([myCard1,myCard2,myCard3,myCard4])

    expect(myDeck.cards_in_category(:Sandwiches)).to eq(0)
  end
end