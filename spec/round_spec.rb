require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do
  it 'exists and has attributes' do
    # Arrange: Create cards and a Deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is 5 + 5?", "10", :Math)
    deck = Deck.new([card_1, card_2])

    # Arrange: Create a Round with the Deck
    round = Round.new(deck)

    # Assert: Check the Round attributes
    expect(round).to be_a(Round)
    expect(round.deck).to eq(deck)
    expect(round.turns).to eq([])
  end

  it 'takes a turn and provides feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is 5 + 5?", "10", :Math)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    # Act: Take a turn
    turn = round.take_turn("Juneau")

    # Assert: Verify the Turn object and feedback
    expect(turn).to be_a(Turn)
    expect(turn.correct?).to eq(true)
    expect(round.turns).to eq([turn])
    expect(round.number_correct).to eq(1)
  end

  it 'calculates percent correct and filters by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is 5 + 5?", "10", :Math)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("5")

    # Assert: Verify percentages
    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.percent_correct_by_category(:Math)).to eq(0.0)
  end
end
