require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  context 'check for existance and features' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    it 'exists' do
      expect(round).to be_instance_of(Round)
    end

    it 'check the deck in round' do
      expect(round.deck).to eq(deck)
    end

    it 'turns into an empty array' do
      expect(round.turns).to eq([])
    end

    it 'check current card' do
      expect(round.current_card).to eq(card_1)
    end

  end

  context 'check for action of round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    it 'show new turn as instance of Turn' do
      expect(new_turn).to be_instance_of(Turn)
    end

    it 'check if new turn is correct' do
      expect(new_turn.correct?).to eq(true)
      expect(round.turns).to eq([new_turn])
    end

    it 'check number of correct turns' do
      expect(round.number_correct).to eq(1)
    end

  end

  context 'check for turn action and count' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    round.deck
    round.current_card

    it 'check current card after turn' do
      expect(round.current_card).to eq(card_2)
    end

    it 'check turn card and count' do
      expect(round.take_turn("Venus")). to eq(round.turns[1])
      expect(round.turns.count).to eq(2)
    end

    it 'check feedback is correct or incorrect' do
      expect(round.turns.last.feedback).to eq("Incorrect.")
    end

    it 'check number of correct answers' do
      expect(round.number_correct).to eq(1)
    end

    it 'check category' do
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'check percent correct that have been guessed' do
      expect(round.percent_correct).to eq(50.0)
    end

    it 'check percent correct by category' do
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

    it 'turn to current card in round' do
      require "pry"; binding.pry
      expect(round.current_card).to eq(card_3)
    end

  end

end


# round.turns.last.feedback
#
# round.number_correct
#
# round.number_correct_by_category(:Geography)
#
# round.number_correct_by_category(:STEM)
#
# round.percent_correct
#
# round.percent_correct_by_category(:Geography)
#
# round.current_card
