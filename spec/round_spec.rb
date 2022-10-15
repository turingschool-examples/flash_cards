require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  round = Round.new(deck)

  it 'exists' do
    expect(round).to be_a Round
  end

  it 'has a deck' do
    expect(round.deck).to eq deck
  end

  describe '#turns' do
    it 'returns an array of all past turns' do
      expect(round.turns).to eq []

      round.take_turn("Juneau")

      expect(round.turns).to eq [["Juneau",card_1]]

      round.take_turn("Venus")

      expect(round.turns).to eq [["Juneau",card_1],["Venus",card_2]]
    end
  end

  describe '#take_turn' do
    it 'takes a guess and passes it with the current card to a new turn object' do

# test
      expect(round.turns).to eq []

      new_turn = round.take_turn("Juneau")

      expect(new_turn).to eq ["Juneau",card_1]

      new_turn = round.take_turn("Venus")

      expect(new_turn).to eq ["Venus",card_2]
    end
  end

  describe '#current_card' do
    it 'returns the current (i.e. first) card' do
      expect(round.current_card).to eq card_1
    end
    it 'returns the next card after a turn' do
      round.take_turn("Juneau")
      
      expect(round.current_card).to eq card_2
    end
  end

  describe '#number_correct' do
    it 'returns the number of correct answers' do
      expect(round.number_correct).to be 0

      round.take_turn("Juneau")

      expect(round.number_correct).to be 1

      round.take_turn("Venus")

      expect(round.number_correct).to be 1
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct answers by category' do
      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.number_correct_by_category(:Geography)).to be 1
      expect(round.number_correct_by_category(:STEM)).to be 0
    end
  end

  describe '#percent_correct' do
    it 'returns the percentage of correct guesses' do
      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct).to be 50.0

      round.take_turn("North")

      expect(round.percent_correct).to be 33.3
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns the percentage of correct guesses' do
      round.take_turn("Juneau")
      round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to be 100.0
      expect(round.percent_correct_by_category(:STEM)).to be 0.0

      round.take_turn("North")

      expect(round.percent_correct_by_category(:Geography)).to be 50.0
    end
  end
end
