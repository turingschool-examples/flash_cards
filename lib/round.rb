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
        new_turn = Turn.new(guess, current_card)
        @deck.rotate
        @turns << new_turn
        new_turn
    end
end