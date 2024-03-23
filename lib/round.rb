require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

    attr_reader :deck, :current_card

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0 # Initialize current_card_index to start with the first card need this in order to read cards and keep order of what car goes next
    end

    def turns
        @turns
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)  # Create a new turn with the current card and the guess
        @turns << new_turn  # Add the new turn to the list of turns
        @current_card_index += 1  # Move to the next card for the next turn
        new_turn  # Return the new turn
    end

    def current_card
        @deck.cards[@current_card_index] # Use the current_card_index to get the current card from the deck not any other class
    end
end