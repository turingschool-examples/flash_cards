class Round
    attr_reader :deck, :turns, :current_card

    def initialize(guess, turns)
        @deck = deck
        @turns = []
        @current_card = current_card
    end

    def new_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @current_card = deck.card[@turns.count]
    end

    def current_card(card)
        @card.current_card
    end

    def take_turn(card)
        take_turn == @current_card
    end

    def number_correct
        if @turns.correct?
            1
        else
            0
        end
    end

    def turns_count
        @turns.count == 2
    end

    def turns_last_feedback(turns)
        last_turn = turns.last
        last_turn.feedback
    end

    def number_of_catagorys_correct_in(deck)
        geography_catagory = catagory.correct
        geography_catagory.feedback
    end

    def number_of_catagorys_correct_in(deck)
        stem_catagory = catagory.correct
        stem_catagory.feedback
    end
end