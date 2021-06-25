require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography) #<Card:0x00007fa16104e160
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)#<Card:0x00007fa160a62e90
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)#<Card:0x00007fa161a136f0
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards) #<Deck:0x00007fa160a38ed8...>
  end

  it 'exists & has attributes' do
    expect(deck).to be_a(Deck) 
    expect(deck.cards).to eq([card1, card2, card3])
    expect(deck.count).to eq(3)
    expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
    expect(deck.cards_in_category(:Geography)).to eq([card1])
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end
end
