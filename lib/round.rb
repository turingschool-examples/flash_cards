class Round
    attr_reader :deck, :turns, :turn, :guess, :turns_taken

    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
        @turns_correct = 0
    end

    def current_card
       @deck.cards.sample
    end

    def take_turn(guess)
        new_turn = Turn
        @turns << new_turn
        @turns_taken += 1
    end

    # def number_correct
    #     @turns.find_all do |new_turns|
    #         if new_turns.correct? == true
    #              @number_correct += 1
    #         end
    #     end
    # end

    # def take_turn(guess)
    #     @turn = Turn.new(guess, card)
    #     @guess 
    #     @turns << turn
    #     @turns_taken += 1


    #     @turn

    # end

    # # def take_turn(guess)
    #    new_turn = Turn.new(guess, card)
    #    @turns << new_turn
    #    @turns_taken += 1
    #    @deck.cards = @deck.cards.rotate(1)

    #    new_turn

    # end

    # def number_correct
    #     if turn.correct? == true
    #         @number_correct += 1
    #     else
    #     end
    # end

end