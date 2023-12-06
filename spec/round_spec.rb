require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'

RSpec.describe Round do
    let(:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
    let(:card2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
    let(:card3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
    let(:cards) {[card1, card2, card3]}
    let(:deck) {Deck.new(cards)}
    let(:round) {Round.new(deck)}

    describe 'initialize' do
        it 'creates a new Round with the correct deck and turns' do
            expect(round.deck).to eq(deck)
            expect(round.turns).to eq([])
          end
    end

    describe 'current_card' do
        it 'outputs the correct card' do
            expect(round.current_card).to eq(card1)
        end
    end


    describe 'take_turn' do
        it 'aquires a new guess and assigns it to new card' do
            new_turn = round.take_turn("Juneau")
            expect(new_turn.class).to eq(Turn)
            expect(round.turns).to eq([new_turn])
      
          end
    end

    describe 'number_correct' do
        it 'returns the number of correct turns' do
        round.take_turn("Juneau")
        expect(round.number_correct).to eq(1)
        end
    end

    describe 'number_correct_by_category' do
        it 'returns the correct number of correct turns in a specific category' do
        round.take_turn("Juneau")
        round.take_turn("Venus")
        expect(round.number_correct_by_category(:STEM)).to eq(1)
        end
    end

    describe 'percent_correct' do
        it 'returns the correct percentage of correct turns' do
        round.take_turn("Juneau")
        round.take_turn("Venus")
        expect(round.percent_correct).to eq(50.0)
        end
    end

    describe 'percent_correct_by_category' do
        it 'returns the correct percentage of correct turns in a specific category' do
        round.take_turn("Juneau")
        round.take_turn("Venus")
        expect(round.percent_correct_by_category(:Geography)).to eq(50.0)
        end
    end
end