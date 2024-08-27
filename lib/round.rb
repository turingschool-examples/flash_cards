class Round
    attr_reader :deck,
                :turns,
                :number_correct,
                :percent_correct,
                :unique_categories


    def initialize(deck)
        @deck=deck
        @turns=[]
        @number_correct=0
        @percent_correct=0
        @unique_categories=[]
        
    end

    def current_card
        @deck.cards[@turns.count]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess,@deck.cards[@turns.count])
        if new_turn.correct? == true
            @number_correct +=1
        end
        @turns << new_turn
        @percent_correct= ((@number_correct).to_f/ @turns.count)*100
        new_turn
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
        total_by_cat=0
        @turns.each do |turn|
            if turn.card.category == cat
                total_by_cat +=1
            end
        end
        (((number_correct_by_category(cat)).to_f)/total_by_cat)*100
    end

    def get_unique_categories
        deck.cards.each do |card|
            @unique_categories << card.category
        end
        @unique_categories.uniq!
    end

    def start
        puts "Welcome! You're playing with #{deck.count} cards"
        puts "------------------------------------------------"

        deck.cards.each do |card|
        puts "This is card number #{deck.cards.index(card)+1} out of #{deck.count}. "
        puts "Question: #{card.question}"
        guess = gets.chomp
        take_turn(guess)
        puts turns.last.feedback
        end

        puts "**** Game over! ****"
        puts "You had #{number_correct} out of #{turns.count} for a total score of #{percent_correct}%."

        get_unique_categories
        @unique_categories.each do |category|
            puts "#{category} - #{(percent_correct_by_category(category)).round}% correct." 
        end
    end
end