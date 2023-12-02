class Round
   attr_accessor :deck,
                 :turns

   def initialize (deck)
        @deck = deck
        @turns = []
        @turn_count = 0
    end

    def current_card
       @deck.cards[@turn_count]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
       
        turns = @turns.push(new_turn)
        @turn_count += 1

        new_turn
    end

    

end