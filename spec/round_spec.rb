require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

describe Round do 
    describe 'initialize' do 
        it 'is an instance of round' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round).to be_instance_of(Round)
        end 

        it 'creates a new deck' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round.deck).to eq(deck)
        end 

        it 'creates a new turn' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round.turns).to eq([])
        end 

        it 'selects a current card' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round.current_card).to eq(card_1)
        end 
        
        it 'will take a new turn' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            
            expect(new_turn).to be_instance_of(Turn)
        end 

        it 'will add take_turn into rounds' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            turns = round.turns

            expect(turns).to eq([new_turn])
        end 

        it 'will count the number of correct answers' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            turns = round.turns
            number_correct = round.number_correct

            expect(number_correct).to eq(1)
        end 

        it 'will count the number correct by category' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")
            turns = round.turns
            number_correct = round.number_correct
            cat_correct = round.number_correct_by_category(:Geography)
         

            # require 'pry'; binding.pry
            expect(cat_correct).to eq (1)

            round.take_turn("Mars")
            cat_correct = round.number_correct_by_category(:STEM)

            
            
            round.take_turn("North north west")
            cat_correct = round.number_correct_by_category(:STEM)

            
            expect(cat_correct).to eq(2)

         end 
     end     
end

       