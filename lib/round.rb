class Round
    attr_reader :deck,
                :turns,
                :number_correct,
                :percent_correct


    def initialize(deck)
        @deck=deck
        @turns=[]
        @number_correct=0
        @percent_correct=0
        
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
        @percent_correct= ((@number_correct).to_f/ @turns.count)*100
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

    def percent_correct_by_category(cat)
        per_correct_by_cat=0
        total_by_cat=0
        @turns.each do |turn|
            if turn.card.category == cat
                total_by_cat +=1
                if turn.guess == turn.card.answer
                    per_correct_by_cat +=1
                end
            end
        end
        #require "pry" ; binding.pry
        (((per_correct_by_cat).to_f)/total_by_cat)*100
    end


end