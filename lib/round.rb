class Round

    attr_reader :deck, 
                :turns, 
                :current_card,
                :turn

    def initialize(deck)
        @deck=deck
        @turns=[]
        @card_index=0
        @number_correct=0
    end

    def current_card
        @deck.cards[@card_index]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @deck.cards.shift
        return new_turn
    end

    def number_correct(turn)
        if turn.correct? == true
        @number_correct += 1
        return @number_correct
        end
    end

end