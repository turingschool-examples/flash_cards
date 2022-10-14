require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'the student has a deck of cards' do
    card_1 = Card.new(
      "What is the capital of Alaska?",
      "Juneau",
      :Geography
    )
    card_2 = Card.new(
      "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
      "Mars",
      :STEM
    )
    card_3 = Card.new(
      "Describe in words the exact direction that is 697.5° clockwise from due north?",
      "North north west",
      :STEM
    )
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
    expect(deck.cards[1]).to eq(card_2)
  end

  describe '#round' do
    it 'student plays a round' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)
      expect(round.deck.cards[2].category).to eq(:STEM)
    end
  end

  describe '#turns' do
    it 'student takes a turn' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
    it 'student takes a turn by guessing the question' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
      expect(round.current_card).to eq(card_1)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.class).to eq(Turn)
      expect(new_turn.correct?).to be true
      expect(round.turns).to eq([new_turn])
      expect(round.current_card).to eq(card_2)
    end
  end

  describe '#number_correct' do
    it 'tracks number of correct turns' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.number_correct).to eq(0)

      round.take_turn("Juneau")

      expect(round.number_correct).to eq(1)
      expect(round.current_card).to eq(card_2)

      round.take_turn("Homer")
      expect(round.turns.count).to eq(2)
      expect(round.turns.last.feedback).to eq("Incorrect.")
      expect(round.number_correct).to eq(1)

      round.take_turn("North north west")

      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct turns by each category' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")
      round.take_turn("North north west")

      expect(round.number_correct).to eq(2)
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(1)
      expect(round.number_correct_by_category(:Math)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'returns the percent of correct turns' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct).to eq(50.0)

      round.take_turn("North north west")

      expect(round.percent_correct).to eq(66.7)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns the percent of correct turns by category' do
      card_1 = Card.new(
        "What is the capital of Alaska?",
        "Juneau",
        :Geography
      )
      card_2 = Card.new(
        "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
        "Mars",
        :STEM
      )
      card_3 = Card.new(
        "Describe in words the exact direction that is 697.5° clockwise from due north?",
        "North north west",
        :STEM
      )
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.current_card).to eq(card_3)
    end
  end
end
