require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  context 'initialize' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = Turn.new("Juneau", round.current_card)

    it 'exists' do
      expect(round).to be_a(Round)
    end

    it 'has a deck' do
      expect(round.deck).to eq(deck)
    end

    it 'has turns' do
      expect(round.turns).to eq([])
    end

    it 'shows current card' do
      expect(round.current_card).to eq(card_1)
    end

    it 'takes a turn' do
      round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
    end

    it 'checks answer' do
      expect(new_turn.correct?).to eq(true)
    end

    it 'adds turns to array' do
      expect(round.turns).to include(Turn)
    end

    it 'counts turns' do
      expect(round.turns.count).to eq(1)
    end

    it 'returns feedback' do
      expect(round.turns.last.feedback).to eq("Correct!")
    end

    it 'counts correct answers' do
      round.take_turn("Mars")
      expect(round.number_correct).to eq(2)
    end

    it 'groups correct answers by category' do
      expect(round.number_correct_by_category(:STEM)).to eq(1)
      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'calculates percentage of correct answers' do
      round.number_correct_by_category(:STEM)
      round.number_correct_by_category(:Geography)


    end
  end
end
