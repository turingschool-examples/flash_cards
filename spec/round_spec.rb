require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'


RSpec.describe Round do
    describe '#initialize' do
        it 'exists' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)

            expect(Round.new(deck)).to be_a Round
        end

        it 'has a deck' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)

            expect(Round.new(deck).deck).to eq deck
        end

        it 'has empty turns array by default' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            deck = Deck.new(card)

            expect(Round.new(deck).turns).to eq []
        end
    end

    describe '#current_card' do
        it 'can return the current card in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            expect(round.current_card).to eq card_1
        end
    end

    describe '#take_turn' do
        
        it 'can create a new turn object' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)

            expect(round.take_turn("Juneau")).to be_a Turn
        end

        it 'stores turn object in turns array' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            round.take_turn("Juneau")

            expect(round.turns).to eq [card_1]
        end


        it 'has default argument card, the first card in round.deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn("Juneau")

            expect(turn.card).to eq round.deck[0]
        end


        it 'can pass in a guess' do
            
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')

            expect(turn.guess).to eq 'Juneau'
            expect(turn).to receive(:guess)
        end

        it 'moves on to the next card in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')

            expect(round.deck[0]).to be card_2
        end
    end

end