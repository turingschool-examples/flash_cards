require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require '../lib/round'
require 'pry'


RSpec.describe Round do
  it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_an_instance_of Round
  end

  it "each round has a deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it "shows turns completed" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it "shows current card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = []
    cards << card_1 << card_2 << card_3

    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.current_card).to eq(cards[0])
  end


end
