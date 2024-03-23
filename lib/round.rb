require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

    attr_reader :deck

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def turns
        @turns
    end

    def current_card

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)  # Create a new turn with the current card and the guess
        @turns << new_turn  # Add the new turn to the list of turns
        @current_card_index += 1  # Move to the next card for the next turn
        new_turn  # Return the new turn
    end

end