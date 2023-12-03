require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Round

    attr_reader :deck

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        #make a new turn. 
        #pass guess and current card
        turn = Turn.new(guess, current_card)
    end

    def new_turn
         round.take_turn("Juneau")
    end
            
        
    

    def correct?(new_turn)
        @guess == @answer
    end

end