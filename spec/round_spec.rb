require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


RSpec.describe Deck do

  xit 'exists' do

    round = Round.new()

    expect(round).to be_instance_of(Round)

  end

  it 'takes a deck as an argument' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.deck).to eq(deck)

  end

  it 'returns empty array on .turns before turns called' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.turns).to eq([])

  end

end
