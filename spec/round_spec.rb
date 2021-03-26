require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  xit 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)
    
    expect(round).is_a? Round 
  end

  xit 'check that round has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.deck).to eq deck
  end

  xit 'checks that round is an empty array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.turns).to eq []
  end

  xit 'returns the current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.current_card).to eq card_1
  end

  it 'creates a new turn with appropriate guess and card' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    require 'pry'; binding.pry
    expect(new_turn).is_a? Turn
  end

  xit 'takes new turn' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Venus")

    expect(round.take_turn("Venus")).to eq new_turn_2
  end

  xit 'stores turns in turns array' do
    card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck       = Deck.new([card_1, card_2, card_3])
    round      = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Venus")

    expect(round.turns).to eq [new_turn_1, new_turn_2]
  end

  xit 'returns numbers of turns in turns array' do
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
  end
end
