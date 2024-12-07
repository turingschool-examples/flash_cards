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
    it 'has turns'do
    #records or stores the turns taken
    end
    it 'selects a current_card' do
        #brings up first card from deck and the next card after the turn is taken
    end
    it 'lets user take_turn' do
        #takes a string arg or guess
        #creates new turn object with guess and card number
        #stores this in 'has turns' method
        #moves on to the next card in deck
    end
    it 'checks guess for correctness'
    #will record if guess matches answer
    end
    it 'will count correct answers' do
        #if the answer is correct it will be counted
    end
    it 'will count the amount of turns taken' do
        #counts how many turns have been taken
    end
    it 'gives feedback on last turn'do
    #will say if answer was correct or not
    end
    it 'will check the number correct by category' do
        #how many were correct in each category
    end
    it 'will calculate percent correct' do
        #^
    end
    it 'will calculate percent correct by category'do
    #^
    end
end