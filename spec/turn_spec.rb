require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  # test it exists
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    # card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # # deck = Deck.new([card_1, card_2, card_3])
    # round = Round.new(deck)
    new_turn = Turn.new("Juneau", card_1)
    
    expect(new_turn).to be_instance_of(Turn)
  end

  # test it has a card
  it 'has a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    # card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # deck = Deck.new([card_1, card_2, card_3])
    # round = Round.new(deck)
    new_turn = Turn.new(card_1, "Juneau")
    # require 'pry'; binding.pry
    
    expect(new_turn.card).to eq(card_1)
  end
  # it has a guess
  it 'has a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    expect(new_turn.guess).to eq("Juneau")
  end
  # it checks if correct
  it 'checks if correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    # require 'pry'; binding.pry

    expect(new_turn.correct?).to eq(true)


  end
  # it provides feedback



end