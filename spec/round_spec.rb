require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'
require 'pry'

describe Round do
  it 'has card instances and variables available at Init' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck.cards[0]).to be_instance_of(Card)
    expect(round.deck).to be_instance_of(Deck)
    expect(round).to be_instance_of(Round)
    expect(round.curr_card_idx).to eq(0)
    expect(round.current_card.answer).to eq("Juneau")
    expect(round.turns).to eq([])
    expect(round.number_correct).to eq(0)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'can process turns with correct input' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to be true
    expect(round.turns.count).to eq(1)
    expect(round.number_correct).to eq(1)
    expect(round.percent_correct).to eq(100)
end

  it 'can process turns with incorrect input' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")

    expect(round.percent_correct).to eq(50)
    expect(round.number_correct).to eq(1)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.current_card.category).to eq(:STEM)
    expect(round.current_card).to be_instance_of(Card)
    expect(round.current_card.answer).to eq("North north west")
  end

  it 'can process user interaction messages' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° 
      clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    new_turn = round.take_turn("Venus")
    
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.percent_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end
end
