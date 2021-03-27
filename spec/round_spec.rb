require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to be_instance_of(Deck)
  end

  it 'has turns' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has current card' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    # binding.pry
    expect(round.current_card).to eq(card_1)
  end

  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    # take_turn = Turn.new
    # new_turn = round.take_turn("Juneau")
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", round.current_card)
    # binding.pry

    expect(new_turn.class).to equal(Turn)
  end

end




#
