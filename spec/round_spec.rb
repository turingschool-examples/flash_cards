require 'RSpec'
require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'

RSpec.describe Round do
  describe '#initialize' do
    it 'creates a new instance' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end

    it 'accepts a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end

    it 'creates an empty array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)

      expect(round.turns).to eq([])
    end
  end

  describe '#current_card' do
    it 'shows current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)

      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
    it 'takes a string representing a guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      new_turn = round.take_turn('Juneau')

      expect(new_turn.guess).to eq("Juneau")
    end

    it 'creates a new take_turn object' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn.class).to eq(Turn)
    end

    it 'stores new turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.turns.count).to eq(1)
    end

    it 'moves to the next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(card_2)
    end
  end

  describe '#correct_turns' do
    it 'creates array with correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.correct_turns).to eq(round.turns)
    end
  end

  describe '#number_correct' do
    it 'returns number of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.number_correct).to eq(1)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns number of correct guesses by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end
  end

  describe '#percent_correct' do
    it 'returns percent of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.percent_correct).to eq(100)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns percent of correct guesses by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.percent_correct_by_category(:Geography)).to eq(100)
    end
  end

  describe '#cards_remaining?' do
    it 'tests if there are cards not guessed upon' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards  = [card_1, card_2, card_3]
      deck   = Deck.new(cards)
      round  = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.cards_remaining?).to eq(true)
    end
  end
end
