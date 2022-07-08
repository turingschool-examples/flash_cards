require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

    RSpec.describe Round do

        it 'exists' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            expect(round).to be_instance_of(Round)
        end

        it 'has attributes' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            
            expect(round.deck).to eq(deck)
            expect(round.turns).to eq([])
            expect(round.current_card).to eq(card_1)
        end

        it 'keeps track of current card' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            
            expect(round.current_card).to eq(card_1)
        end

        it 'can take a turn which outputs a Turn class object' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            expect(new_turn).to eq(round.turns.at(0))
            expect(new_turn).to be_instance_of(Turn)
            next_turn = round.take_turn("Venus")
            expect(next_turn).to eq(round.turns.at(1))
            expect(next_turn).to be_instance_of(Turn)
        end

        it 'can determine if turn answer was correct and provide feedback' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(new_turn.correct?).to be true
            expect(round.turns.last.feedback).to eq("Correct!")

            next_turn = round.take_turn("Venus")

            expect(next_turn.correct?).to be false
            expect(round.turns.last.feedback).to eq("Incorrect.")


        end

        it 'keeps track of past turns' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(round.turns).to eq([new_turn])

            next_turn = round.take_turn("Venus")

            expect(round.turns).to eq([new_turn, next_turn])

        end

        it 'can keep track of number of correct answers' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            new_turn = round.take_turn("Juneau")

            expect(round.number_correct).to be 1

            next_turn = round.take_turn("Venus")

            expect(round.number_correct).to be 1

            final_turn = round.take_turn("North north west")

            expect(round.number_correct).to be 2
        end

        it 'keep track of current cards' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(round.current_card).to eq(card_2)

            next_turn = round.take_turn("Venus")

            expect(round.current_card).to eq(card_3)
        end

        it 'can provide stats about answers' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            expect(round.number_correct).to be 1
            expect(round.percent_correct).to be 100.0
            next_turn = round.take_turn("Venus")
            expect(round.number_correct).to be 1
            expect(round.percent_correct).to be 50.0
        end

        it 'can provide stats about answers by category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            expect(round.total_correct_by_category[:Geography][0]).to be 1
            expect(round.total_correct_by_category[:STEM][0]).to be 0
            next_turn = round.take_turn("Venus")
            expect(round.total_correct_by_category[:Geography][0]).to be 1
            expect(round.total_correct_by_category[:STEM][0]).to be 0
        end
    end