class Round 
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end     
    
    def current_card
        @deck.cards.first
    end 

    def take_turn(guess)
        # takes a string representing the guess
        # create a new turn object with guess and Card
        # store new turn and return it from the method
        # round should move to next card in deck
    end 
end 