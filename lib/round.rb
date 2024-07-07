class Round
    
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @correct_guesses = 0
        @card_index = 0
    end

    def current_card
        @deck.cards[@card_index]
    end


    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @card_index += 1
        if new_turn.correct? == true
            @correct_guesses += 1
        end
        return new_turn
    end
    
    def number_correct
        @turns.count do |turn|
            if turn.correct? == true
                puts @correct_guesses
            end
        end
        return @correct_guesses
    end

    # def number_correct_by_category(category)

    # end
end