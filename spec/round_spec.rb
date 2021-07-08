require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end

    it 'has an empty turn array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

    it 'starts with the first card as the current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
    it 'returns a Turn object' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.class).to be(Turn)
    end

    it 'stores the turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.turns).to eq([new_turn])
    end

    it 'changes current card to the next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      current = round.current_card

      expect(current).to eq(card_2)
    end

    it 'adds an additional turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")

      expect(round.turns.count).to eq(2)
    end
  end

  describe '#current_index' do
    it 'returns the index of the current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.current_index).to eq(0)
    end
  end

  describe '#next_card' do
    it 'moves to the next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.next_card).to eq(card_2)
    end
  end

  describe '#number_correct' do
    it 'returns 1 after 1 correct answer' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to be(1)
    end

    it 'still returns 1 when 1 answer is correct, and 1 is incorrect' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")

      expect(round.number_correct).to be(1)
    end

    it 'returns 0 when 0 answers are correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("London")

      expect(round.number_correct).to be(0)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns 1 when 1 question in the chosen category is correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.number_correct_by_category(:Geography)).to be(1)
    end

    it 'returns 0 when a different category is chosen' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.number_correct_by_category(:STEM)).to be(0)
    end
  end

  describe '#percent_correct' do
    it 'returns 50.0 for 1/2 guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns 100.0 for 1/1 in the same category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end

  describe '#turns_by_category' do
    it 'returns 1 when 1 turn is taken in the category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.turns_by_category(:Geography)).to eq(1)
    end
  end
end
