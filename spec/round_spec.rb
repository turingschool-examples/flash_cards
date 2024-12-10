require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'


RSpec.describe Round do
    
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'stores deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'starts with empty turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turn).to eq([])
    end

    it 'has the current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end


    it 'is an instance of Turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to a_instance_of(Turn)
    end

    it 'that it is correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to eq(true)
    end
    it 'test round count' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")
    
        expect(round.turns).to eq(2)
    end

    it 'number correct in round' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)

        round.take_turn("Venus")
        
        expect(round.number_correct).to eq(1)
    end

    it 'shows the current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")

        expect(round.current_card).to eq(card_2)
    end

    it 'counts the turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.turns.count).to eq(2)
    end

    xit 'The last feedback' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        

        expect(round.last.feedback).to eq('Incorrect.')
    end

    it 'correct number' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.number_correct).to eq(1)
    end

    it 'correct category guesses' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")


    expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'correct number in category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")
        
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
    it 'percent right' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.percent_correct).to eq(50.0)
    end

    it 'percent by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    end

    it 'current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        round.take_turn("Venus")

        expect(round.current_card).to eq(card_3)
    end

    
end
