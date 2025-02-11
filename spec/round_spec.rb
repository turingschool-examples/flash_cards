require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'
require 'pry' 

describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'chooses the current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)

    end 


    it 'takes a turn' do
         card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
         card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
         card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        
         cards = [card_1, card_2, card_3]
         deck = Deck.new(cards)
         round = Round.new(deck)
         turn = Turn.new("Juneau", card_1)
         new_turn = round.take_turn("Juneau")


         expect(turn).to be_instance_of(Turn)
         #expect (round.turns.count).to eq(1)
         #expect(new_turn.class).to eq(Turn)
         #expect(new_turn.correct?).to eq(true)
        

    end


end  

