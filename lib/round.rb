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
        @turns << new_turn_test
        #require "pry" ; binding.pry
        new_turn_test

    end

    def number_correct_by_category(cat)
        num_correct_by_cat=0
        @turns.each do |turn|
            if turn.card.category == cat
                if turn.guess == turn.card.answer
                    num_correct_by_cat +=1
                end
            end
        end
        num_correct_by_cat
    end


end