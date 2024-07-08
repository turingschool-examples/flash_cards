class Round
    attr_reader :deck, :turns
   
    def initialize(deck)
        @deck = deck
        @turns = []
        @card_index = 0
    end

    def current_card
        #get the first card in the deck
        # require 'pry';binding.pry
        card = @deck.cards[@card_index]
        return card
    end

    def take_turn(guess)
        #take a string representing a guess
        #creates a new Turn object with the appropriate Card and guess
        #store this new turn and return it from the take turn method
        #round should move on to the next card in the deck when the take turn method is called
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @card_index += 1
        return new_turn
    end
end