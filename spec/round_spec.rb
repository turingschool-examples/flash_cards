require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  it '#exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_a Round
  end

  it '#turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq []
  end

  it '#takes current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.current_card).to eq card_1
  end

  it '#takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    # new_turn = round.take_turn(guess)
    # expect(new_turn).to be_a Turn
    expect(round.current_card).to eq(deck.cards[0])
  end

  it '#is correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = Turn.new("Juneau", card_1)
    expect(new_turn.correct?).to eq true
  end
  it '#number correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_1)
    round.number_correct
    expect(round.correct).to eq 1
  end

  it '#takes current card for card 2' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    expect(round.current_card).to eq card_2
  end

  it '#turns for card_2' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_2)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    expect(round.current_card).to eq(deck.cards[0])
  end

  it '#count of turns array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_2)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    expect(round.turns.count).to eq(2)
  end

  it '#return turn last element feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_2)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

  it '#return turn last element feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_2)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    round.number_correct
    expect(round.correct).to eq(1)
  end

  it '#number_correct_by_category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_2)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    round.number_correct
    expect(round.number_correct_by_category(:Geography)).to eq 1
    expect(round.number_correct_by_category(:STEM)).to eq 0
  end

  it '#percent correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_1)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    round.number_correct
    expect(round.percent_correct).to eq 50.0
  end

  it '#percent correct by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_1)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    round.number_correct
    expect(round.percent_correct_by_category(:Geography)).to eq 100.0
  end

  it '#takes current card for card 3' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", card_1)
    round.number_correct
    round.take_turn("Venus")
    new_turn = Turn.new("Venus", card_2)
    expect(round.current_card).to eq card_3
  end

end
