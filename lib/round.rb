require './lib/deck.rb'
require './lib/turn.rb'

class Round
   attr_accessor :deck,
                 :turns

   def initialize (deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end
    
    def take_turn(guess)
        Turn.new(guess, current_card)
        # @deck.shuffle!
    end
end