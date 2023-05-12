require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'
require 'rspec'


describe Round do

    it 'create new round' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.deck).to be_a Deck
    end

    it 'takes deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'begins turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.turns.count).to eq(0)

        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_a Turn
        expect(new_turn.guess).to eq("Juneau")
        expect(new_turn.card).to eq(card_1)
        expect(round.turns.count).to eq(1)
        expect(round.turns.last).to eq(new_turn)
    end

    it 'takes new card for turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
        round.take_turn("Juneau")
  
        expect(round.current_card).to eq(card_2)
        round.take_turn("Venus")
  
        expect(round.current_card).to eq(card_3)
    end

    it 'return number of correct guesses' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.number_correct).to eq(0)
        turn1 = round.take_turn("Juneau")
        expect(turn1.feedback).to eq("Correct!")
        expect(round.number_correct).to eq(1)

        turn2 = round.take_turn("Venus")
        expect(round.number_correct).to eq(1)
        expect(turn2.feedback).to eq("Incorrect")
    end

    it 'returns correct guesses by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.number_correct_by_category(:Geography)).to eq(0)

        round.take_turn("Juneau")
        expect(round.number_correct_by_category(:Geography)).to eq(1)

        round.take_turn("Venus")
        expect(round.number_correct_by_category(:Geography)).to eq(1)
  
        expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'returns percent correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn("Juneau")
        expect(round.percent_correct).to eq(100)
  
        round.take_turn("Venus")
        expect(round.percent_correct).to eq(50)
  
        expect(round.percent_correct_by_category(:Geography)).to eq(50)
        expect(round.percent_correct_by_category(:STEM)).to eq(0)
    end

end