class Round
    attr_reader :deck, 
                :turns, 
                :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @card_count = 1
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @number_correct += 1 if new_turn.correct?
        @card_count += 1
        p new_turn.feedback
        @deck.rotate_cards
        new_turn
    end

    def number_correct_by_category(category)
        @turns.map {|turn| turn.card.category if turn.correct?}.count(category)
    end

    def percent_correct
        (@number_correct.to_f / @turns.length) * 100
    end

    def percent_correct_by_category(category)
        cards_in_category = @turns.select {|turn| turn.card.category == category}.count
        (number_correct_by_category(category).to_f / cards_in_category) * 100
    end

    def start
        p "Welcome! You're playing with #{@deck.count} cards."
        p "-------------------------------------------------"
        begin_game
    end

    def begin_game
        until @card_count > @deck.count
            p "This is card number #{@card_count} out of #{@deck.count}."
            p "Question: #{current_card.question}"
            user_guess = gets.chomp
            break if user_guess == 'exit'
            take_turn(user_guess)
        end
        end_game
    end

    def end_game
        p '****** Game over! ******'
        p "You had #{@number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct.to_s.sub(/0+$/, '').sub('.', '')}%."
        p "STEM - #{percent_correct_by_category(:STEM).to_s.sub(/0+$/, '').sub('.', '')}% correct"
        p "Turing Staff - #{percent_correct_by_category(:Turing_Staff).to_s.sub(/0+$/, '').sub('.', '')}% correct"
        p "Pop Culture - #{percent_correct_by_category(:Pop_Culture).to_s.sub(/0+$/, '').sub('.', '')}% correct"
    end
end