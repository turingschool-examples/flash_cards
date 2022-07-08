require './lib/turn'
require './lib/deck'
class Round
    attr_reader :deck, :turns
    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
        @current_card_index = 0
    end

    def current_card
        @deck.cards[@current_card_index]
    end

    def take_turn(guess) #takes a string representing the guess
        card = self.current_card #defining the card for this turn
        @current_card_index += 1 #the Round should move on to the next card
        new_turn = Turn.new(guess, card) #creates a new Turn object with the guess and card
        @turns << new_turn #stores the new Turn object and return it
        return new_turn
    end
end   
