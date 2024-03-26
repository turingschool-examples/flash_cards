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
    
  end