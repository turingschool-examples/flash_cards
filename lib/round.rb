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
        @deck[0]
    end
end