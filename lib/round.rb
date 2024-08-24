class Round
    attr_reader :deck,
                :turns,
                :number_correct

    def initialize(deck)
        @deck=deck
        @turns=[]
        @number_correct=0
    end

    def current_card
        @deck.cards[@turns.count]
    end

    def take_turn(guess)
        new_turn_test = Turn.new(guess,@deck.cards[@turns.count])
        if new_turn_test.correct? == true
            @number_correct +=1
        end
        #require "pry" ; binding.pry
        @turns << new_turn_test
        new_turn_test
    end


end