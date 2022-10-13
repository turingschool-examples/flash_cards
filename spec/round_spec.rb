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
            turn = round.take_turn("Juneau")

            expect(round.turns).to eq [turn]
        end


        it 'has default argument card, the first card in round.deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn("Juneau")

            expect(turn.card).to eq card_1
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
            
        end

        it 'can record correct answers' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            turn2 = round.take_turn('Mars')

            expect(round.number_correct).to eq 2
        end


        it 'moves on to the next card in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')

            expect(round.current_card).to be card_2
        end
    end

    describe '#number_correct_by_category' do
        it 'can check if the answer is correct' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            
            expect(round.number_correct_by_category(:Geography)).to eq 1
        end

        it 'can record a correct answer in the appropriate category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            
            expect(round.number_correct_by_category(:Geography)).to eq 1
            expect(round.number_correct_by_category(:STEM)).to eq 0
                        
        end
    end

    describe '#percent_correct' do
        it 'can return percent of correct answers' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            turn2 = round.take_turn('Mars')
            
            expect(round.percent_correct).to eq 100.0

            turn3 = round.take_turn('bad guess')
            expect(round.percent_correct).to be_within(0.1).of(66.6) 
        end
    end

    describe '#percent_correct_by_category' do
        it 'can return the percent correct for one category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            turn2 = round.take_turn('Mars')
            
            expect(round.percent_correct_by_category(:Geography)).to eq 100.0

        end

        it 'can return the percent correct for a different category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) 
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            round = Round.new(deck)
            turn = round.take_turn('Juneau')
            turn2 = round.take_turn('Mars')
            
            expect(round.percent_correct_by_category(:Geography)).to eq 100.0

            turn3 = round.take_turn('bad guess')
            expect(round.percent_correct_by_category(:STEM)).to eq 50.0
        end

    end



end