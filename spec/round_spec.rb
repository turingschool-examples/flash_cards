require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
# require 'pry'
# require 'pry'; binding.pry
RSpec.describe Round do
  describe '#initialize' do
    xit 'has deck with rounds' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round).to include(deck)
    end
  end

    xit 'has turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(turns).to eq([])
  end

  xit 'takes turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(take_turn).to be true
  end

    xit 'stores new turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(new_turn).to eq(round.take_turn)
    end
end
