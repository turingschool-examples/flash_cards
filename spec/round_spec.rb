require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

describe Round do
    describe '#initialize' do
        it 'is an instance of Round' do
            
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round).to be_instance_of(Round)
        end

        it 'has a Deck' do
            
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.deck).to eq(deck)
        end

        it 'has turns' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.turns).to eq([])
        end

        it 'can count number of correct answers' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.number_correct).to eq(0)
        end
    end
    
    describe '#current_card' do
        it 'returns the first card in the deck' do
            
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.current_card).to eq(card_1)
        end
    end

    describe '#take_turn'do
        it 'creates a turn class instance' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)

            expect(round.take_turn("Juneau")).to be_instance_of(Turn)
        end
        
        it 'is a class' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(new_turn.class).to eq Turn
        end
        
        it 'can call turn methods' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(new_turn.correct?).to be true
        end

        it 'stores the new turn in the round' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(round.turns).to eq([new_turn])
        end
    end

    describe '#number_correct' do
        it 'counts the number of correct answers in a round' do

            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(round.number_correct).to eq(1)
        end
    end
end