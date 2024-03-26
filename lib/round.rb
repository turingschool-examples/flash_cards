require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
    attr_reader :deck, :turns
  
    def initialize(deck)
      @deck = deck
      @current_card_index = 0
      @turns = []
    end
      
    def take_turn(guess, cards)
        current_card = @deck.cards[@current_card_index] # establishes the current_card as whichever instance of the card class is at the index being used in the turn
        turn = Turn.new(guess, current_card) # creates a new instance of the turn class with the corresponding guess and current card that are active in the current turn
        @turns << turn 
        @current_card_index += 1 # Moves to next card (or element) in the index
        turn
      end
  end