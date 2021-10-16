require './lib/card'
require './lib/deck'
require './lib/turn'
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
  end

  describe '#deck' do
    it 'shows cards in deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end
  end

  describe '#turns' do
    it 'tracks the number of turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.turns).to eq []
    end
  end

  describe '#current_card' do
    it 'returns the current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
    it 'creates a new turn and progresses to next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.current_card).to eq (card_1)

      expect(round.current_card_position).to eq 0

      new_turn = round.take_turn("Juneau")

      expect(new_turn).to be_instance_of(Turn)

      expect(new_turn.correct?).to be true

      expect(round.current_card_position).to eq 1

      expect(round.current_card).to eq (card_2)
    end
  end

  describe '#number_correct' do
    it 'returns number of correct turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq 1

      new_turn = round.take_turn("Venus")

      expect(round.number_correct).to eq 1

      new_turn = round.take_turn("North north west")

      expect(round.number_correct).to eq 2
    end
  end

  describe '#feedback' do
    it 'tells if answer to last question was correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.turns.last.feedback).to eq("Correct!") # Test for if answer correct

      expect(round.current_card_position).to eq 1

      new_turn = round.take_turn("Venus")

      expect(round.turns.last.feedback).to eq("Incorrect") # Test for if answer incorrect

      expect(round.current_card_position).to eq 2 # Testing that overwriting new_turn variable does not interfere with iteration through deck.
    end
  end

  describe '#number_correct_by_category' do
    it 'tells how many correct in category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct_by_category(:Geography)).to eq 1

      new_turn = round.take_turn("Venus")

      expect(round.number_correct_by_category(:STEM)).to eq 0

      new_turn = round.take_turn("North north west")

      expect(round.number_correct_by_category(:STEM)).to eq 1
    end
  end

  describe '#percent_correct' do
    it 'percent of all answers that are correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.percent_correct).to eq 100

      new_turn = round.take_turn("Venus")

      expect(round.percent_correct).to eq 50
    end
  end

  describe '#percent_correct_by_category' do
    it 'percent of all cards ina  category that were answered correctly' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.percent_correct_by_category(:Geography)).to eq 100

      new_turn = round.take_turn("Venus")

      expect(round.percent_correct_by_category(:STEM)).to eq 0

      new_turn = round.take_turn("North north west")

      expect(round.percent_correct_by_category(:STEM)).to eq 50
    end
  end
end
