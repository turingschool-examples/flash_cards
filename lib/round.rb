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
        current_card = @deck.carrds[@current_card_index]
        turn = Turn.new(guess, current_card)
        @turns << turn
        @current_card_index += 1
        turn
      end
  end