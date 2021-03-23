require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1,card_2,card_3])
    round = Round.new(deck)

    it 'exists' do
        expect(round).to be_instance_of(Round)
    end

    it 'has turn object when taking turn' do
        round.take_turn("Juneau")
        expect(round.turn).to be_instance_of(Turn)
    end

    it 'has the right number of correct guesses' do
        expect(round.number_correct).to eq(1)
    end

    it 'has the right number of correct guesses by category' do
        expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'can have wrong guess' do
        round.take_turn("Wrong")
        expect(round.percent_correct).to eq(50.0)
    end

    it 'has the right percent per category' do
        p = round.percent_correct_by_category(:Geography)
        expect(p).to eq(100.0)
    end
end