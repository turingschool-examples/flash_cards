require 'pry' ; binding.pry
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists for card_1, card_2, card_3' do #Is this bad user empathy?
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(card_1).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
    expect(card_3).to be_instance_of(Card)
    expect(deck).to be_instance_of(Deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.turn).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'has a new turn' do #instance of Turn, not THIS instance of Turn
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
  end

end
