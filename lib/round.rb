class Round
    
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0
        @correct_guesses = 0
    end

    def current_card
        @deck.cards[@current_card_index]
    end


    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @current_card_index += 1
        return new_turn
    end
    

    def number_correct
        @turns.count do |turn|
            if turn.correct? == true
            @correct_guesses += 1
            end
        end
        return @correct_guesses
    end

end