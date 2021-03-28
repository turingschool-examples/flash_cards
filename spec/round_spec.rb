require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    expect(round.current_card).to eq(cards[0])
  end

  it 'takes turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)
    new_turn = Turn.new("Juneau", card_1)

    expect(round.take_turn("Juneau")).to eq(round.turns[0])
  end

  it 'has feedback' do
    card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards      = [card_1, card_2, card_3]
    deck       = Deck.new([card_1, card_2, card_3])
    round      = Round.new(deck)
    new_turn   = Turn.new("Juneau", card_1)
    new_turn_2 = Turn.new("Venus", card_1)

    expect(new_turn.feedback).to eq("Correct")
    expect(new_turn_2.feedback).to eq("Incorrect")
  end

  it 'number correct' do
    card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards      = [card_1, card_2, card_3]
    deck       = Deck.new([card_1, card_2, card_3])
    round      = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("hahah")

    expect(round.number_correct).to eq(2)
  end

  describe 'number_by_category' do
    it 'number correct by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)
      round.take_turn("Juneau")
      round.take_turn("Mars")
      round.take_turn("hahah")

      expect(round.number_by_category(:Geography)).to eq(1)
    end
  end

  describe 'number_correct_by_geography_category' do
    it 'number correct by geography category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)
      round.take_turn("Juneau")
      round.take_turn("Mars")
      round.take_turn("hahah")

      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end
  end

  describe 'number_correct_by_STEM_category' do
    it 'number correct by STEM category' do
      card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards      = [card_1, card_2, card_3]
      deck       = Deck.new([card_1, card_2, card_3])
      round      = Round.new(deck)
      round.take_turn("Juneau")
      round.take_turn("Mars")
      round.take_turn("hahah")

      expect(round.number_correct_by_category(:STEM)).to eq(1)
    end
  end

  it 'percent correct' do
    card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards      = [card_1, card_2, card_3]
    deck       = Deck.new([card_1, card_2, card_3])
    round      = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("hahah")

    expect(round.percent_correct).to eq(66.6)
  end
end
