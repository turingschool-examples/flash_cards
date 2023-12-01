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
        take_turn = Turn.new(guess, current_card) 
        @turns << take_turn 
        @turns[-1]
    end
        

end 