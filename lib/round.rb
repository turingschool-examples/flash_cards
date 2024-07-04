class Round
    attr_accessor :deck,
                  :turns,
                  :number_correct,
                  :turn

    def initialize(deck)
        @deck = deck
        @turns = []
        @turn = 0
        @current_card = @deck.cards[@turn]
        @number_correct = 0
        set_correct_by_category
    end

    def current_card
        @current_card = @deck.cards[@turn]
    end

    def take_turn(guess)
        turn = Turn.new(guess, @current_card)
        @turn += 1
        if turn.correct?
            @number_correct += 1
        end
        turns.push(turn)
    end

    def percent_correct
        value = @number_correct.fdiv(@turn)
        value = value * 100
    end

    def set_correct_by_category
        @correct_by_category = @deck.categories
        #Need to convert the categories into seperate hashs
    end

    def number_correct_by_category(category)
        @correct_by_category.fetch(category)
    end


end