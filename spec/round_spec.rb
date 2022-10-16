require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  it 'will take a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("North north west", card_3)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    #new_turn = round.take_turn("Juneau")
    turn_1_actual = round.take_turn("Juneau")
    expect(turn_1_actual).to be_instance_of(Turn)
    expect(turn_1_actual.guess).to eq("Juneau")
    expect(turn_1_actual.card.category).to eq(:Geography)
    expect(round.number_correct).to eq(1)

  end


  it 'can return number correct by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("North north west", card_3)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    turn_1_actual = round.take_turn("Juneau")

    expect(round.number_correct_by_category(:Geography)).to eq(1)

  end

  it 'can have percent correct' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("North north west", card_3)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    turn_1_actual = round.take_turn("Juneau")

    expect(round.percent_correct).to eq(100)
  end

  it "can have percent correct by category" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("North north west", card_3)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    turn_1_actual = round.take_turn("Juneau")

    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end

















end
