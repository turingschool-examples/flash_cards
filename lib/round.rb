class Round
    attr_reader :deck, :current_card, :turns 

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = []
        @deck_size = deck.cards.length
    end

    def current_card
        @current_card = deck.cards[0]
    end

    def take_turn(guess)
        turn = Turn.new(current_card, guess)
        @turns << turn
        deck.cards.shift
        return turn
    end

    def number_correct
        score = 0
        turns.each do |turn|
            if turn.correct?
                score += 1
            end
        end
        score
    end

    def number_correct_by_category(category_feedback)
        score_by_category = 0
        turns.each do |turn|
            if turn.card.category == category_feedback && turn.correct?
                score_by_category += 1
            end
        end
        score_by_category
    end

    def percent_correct
        (number_correct / turns.length.to_f) * 100
    end

    def percent_correct_by_category(category_feedback)
        score_by_category_percent = 0
        turns.each do |turn|
            if turn.card.category == category_feedback
                score_by_category_percent += 1
            end
        end
        (number_correct_by_category(category_feedback).to_f / score_by_category_percent) * 100
    end
    
    def start
        puts " Welcome! You're playing with #{@deck_size} cards."
        puts "-------------------------------------------------"
        puts "This is card number 1 out of 4."
        puts "#{deck.cards[0].question}"
    end

    def complete
        puts "****** Game over! ******"
        puts "You had 3 correct guesses out of 4 for a total score of 75%."
        final_score_categories = []
        turns.each do |turn|
            final_score_categories << turn.card.category
        end
        final_score_categories.uniq.each do |ctgrs|
            puts "#{ctgrs} - #{percent_correct_by_category(ctgrs).to_i}% correct"
        end
    end
end