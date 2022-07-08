class Round 

    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = []
end


def current_card
    deck.cards[turns.count]
end

def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << turn
    if new_turn.correct?
        @number_correct << new_turn
    end
    new_turn

end


#start method for runner goees heerre, call it in runenerr

#shovel correct turns into array
end
