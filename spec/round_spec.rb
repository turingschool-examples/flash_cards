require 'rspec'
require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'

describe Round do
    card_1 = card_2 = card_3 = cards = deck = round = nil
    before (:each) do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    end

    it 'exists' do

        expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do

      expect(round.deck).to eq(deck)
    end

    it 'starts with no turns' do

        expect(round.turns).to eq([])
    end

    it 'returns the current card' do

        expect(round.current_card).to eq(card_1)
    end

    it 'takes a turn and returns the new turn' do
        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn)
        expect(round.turns).to include(new_turn)
    end

    it 'returns the number of correct guesses' do
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
    end

    it 'returns the number of correct guesses by category' do
        new_turn = round.take_turn("Juneau")
        new_turn = round.take_turn("Venus")

        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'returns the percentage of correct guesses' do
        new_turn = round.take_turn("Juneau")

        expect(round.percent_correct).to eq(100.0)
    end

    it 'returns the percentage of correct guesses based on category' do
        new_turn = round.take_turn("Juneau")

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
end
