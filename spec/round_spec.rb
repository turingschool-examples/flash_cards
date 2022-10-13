require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

RSpec.describe Round do
    describe '#initialize' do

        it 'exists' do
        round = Round.new("deck")

        expect(round).to be_instance_of(Round)
        end
    end

    describe "#current_card" do

        it 'returns correct current card' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.current_card).to eq(card_1)
        end
    end

    describe "#take_turn" do

        it 'takes the turn inputted' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.turns).to eq([new_turn]) 
        end

        it 'moves to the next card' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.current_card).to eq(card_2)
        end

        it 'returns the amount of turns taken' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.turns.count).to eq 1
        end

        it 'returns correct if last answer was correct' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.turns.last.feedback).to eq("Correct!")
        end

        it 'returns incorrect if last answer was incorrect' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            new_turn = round.take_turn("Uranus")

            expect(round.turns.last.feedback).to eq("Incorrect.")
        end

    end

    describe '#number_correct' do
        it 'returns the amount of questions answered correctly' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.number_correct).to eq 1
        end
    end

    describe '#number_correct_by_category' do
        it 'returns the amount of questions answered correctly in a specific category' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.number_correct_by_category(:Geography)).to eq 1

            new_turn = round.take_turn("Mars")

            new_turn = round.take_turn("North north west")

            expect(round.number_correct_by_category(:STEM)).to eq 2
        end
    end

    describe '#percent_correct' do
        it 'returns the percentage of questions answered correctly' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            new_turn = round.take_turn("Uranus")

            expect(round.percent_correct).to eq 50.0
        end
    end

    describe '#percent_correct_by_category' do
        it 'returns the percentage of questions answered correctly in a specific category' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]

            deck = Deck.new(cards)

            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            new_turn = round.take_turn("Uranus")

            expect(round.percent_correct).to eq 50.0
        end
    end

end