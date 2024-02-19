require './lib/card'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
   @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  it "initializes the getter methods for deck, current_card, and turns" do
    round = Round.new(@deck)
    deck = round.deck
    current_card = round.current_card
    turns = round.turns

    expect(deck).to eq(@deck)
    expect(current_card).to eq(@deck.cards[0])
    expect(turns).to eq([])
  end

  it "take a turn" do 
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn.card).to eq(@card_1)
    expect(new_turn.guess).to eq("Juneau")

  end


end