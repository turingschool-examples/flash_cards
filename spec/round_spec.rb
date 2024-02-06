require 'rspec'
require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.configure do |config|
	config.formatter = :documentation
end

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        
        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round).to be_a(Round)
    end

    it 'has a deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        
        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round.deck).to be deck
    end

    it 'starts with an empty turns array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        
        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round.turns).to eq []
    end

    it 'returns the current card when the current_card method is called' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        
        deck = Deck.new(cards)

        round = Round.new(deck)

        expect(round.current_card).to eq card_1
    end

    it 'can take a turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck)   

        new_turn = round.take_turn("Juneau")

        expect(new_turn). to be_a Turn
    end

    it 'can tell you if the guess is correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck)   

        new_turn = round.take_turn("Juneau")    

        expect(new_turn.correct?). to be true

        new_turn = round.take_turn("Venus")

        expect(new_turn.correct?). to be false        
    end

    it 'adds the last turn to the turns array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 
        
        expect(round.turns). to eq []

        turn_1 = round.take_turn("Juneau")

        expect(round.turns).to eq ([turn_1])

        turn_2 = round.take_turn("Venus")

        expect(round.turns).to eq ([turn_1, turn_2])
        expect(round.turns.count). to eq 2
    end

    it 'returns how many guesses are correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 

        expect(round.number_correct).to be 0

        turn_1 = round.take_turn("Juneau")

        expect(round.number_correct).to be 1
    end

    it 'moves a new card to the front of the deck after taking a turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 

        expect(round.current_card).to eq card_1

        turn_1 = round.take_turn("Juneau")

        expect(round.current_card).to eq card_2

        turn_2 = round.take_turn("Venus")
    end

    it 'returns how many guesses are correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 

        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")

        geography_correct = round.number_correct_by_category(:Geography)
        stem_correct = round.number_correct_by_category(:STEM)

        expect(geography_correct).to eq 1
        expect(stem_correct).to eq 0
    end

    it 'returns feedback for last guess' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 

        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")

        feedback = round.turns.last.feedback

        expect(feedback).to eq "Incorrect."
    end

    it 'returns returns what percent of the round that has been answered correctly' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
    
        deck = Deck.new(cards)

        round = Round.new(deck) 

        turn_1 = round.take_turn("Juneau")
        turn_2 = round.take_turn("Venus")

        expect(round.percent_correct).to eq 50.0
    end
end



# A Round will be the object that processes responses and records guesses. A Round is initialized with a Deck. The idea is that when we start a Round, the current card is the first in the deck (the first in the Deck’s array of Cards). When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.

# The take_turn method is the crux of this problem. The take_turn method takes a string representing the guess. It should create a new Turn object with the appropriate guess and Card. It should store this new Turn, as well as return it from the take_turn method. Also, when the take_turn method is called, the Round should move on to the next card in the deck.