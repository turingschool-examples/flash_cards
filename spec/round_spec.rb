require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'starts out with no turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'can know the top, or current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
    expect(round.current_card).to_not eq(card_2)
    expect(round.current_card).to_not eq(card_3)
  end

  it 'can create a Turn when the method "take_turn" is called on Round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.card.question).to eq(card_1.question)
    expect(new_turn.guess).to eq("Juneau")
  end

  it 'can store the created Turn in turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn])
  end

  it 'can change current_card to the next_card in the take_turns method' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.current_card).to eq(card_2)
    expect(deck.cards.count).to eq(2)
  end

  it 'a Turn can know if the guess is correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end

  it 'can keep track of how many correct answers have been collected' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    expect(round.number_correct).to eq 1
    expect(round.number_correct).to_not eq 0

    expect(round.current_card).to eq(card_2)

    round.take_turn("Venus")
    expect(round.turns.count).to eq 2
    expect(round.turns.last.feedback).to eq "Incorrect."
    expect(round.number_correct).to eq 1
    expect(round.number_correct).to_not eq 0
    expect(round.number_correct).to_not eq 2
  end

  it 'can count all the correct answers have been collected inside @turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Juniper")
    expect(round.number_correct).to eq 1
    expect(round.number_correct).to_not eq 0
    expect(round.number_correct).to_not eq 2
  end

  it 'can calculate number of correct answers by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.number_correct_by_category(:Geography)).to_not eq 0
    expect(round.number_correct_by_category(:Geography)).to eq 1
    expect(round.number_correct_by_category(:STEM)).to eq 0
    expect(round.number_correct_by_category(:STEM)).to_not eq 1
  end

  it 'can find all the turns that are correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.correct_turns.count).to eq 1
  end

  it 'can calculate the total percent correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.percent_correct).to eq 50.0
    expect(round.percent_correct).to_not eq 100.0
    expect(round.percent_correct).to_not eq 0.0
  end

  it 'can calculate the percentage of correct by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.percent_correct_by_category(:Geography)).to eq 100.0
    expect(round.percent_correct_by_category(:Geography)).to_not eq 50.0
    expect(round.percent_correct_by_category(:Geography)).to_not eq 0.0
  end

  it 'can find total of turns by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.total_number_by_category(:Geography)).to eq 1
    expect(round.total_number_by_category(:Geography)).to_not eq 0
    expect(round.total_number_by_category(:STEM)).to eq 1
    expect(round.total_number_by_category(:STEM)).to_not eq 0
  end

  it 'can still keep track of what card is the current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")

    expect(round.current_card).to eq card_3
  end
end
