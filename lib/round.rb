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
        puts new_turn.feedback
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
        puts "Welcome! You're playing with #{@deck.count} cards."
        puts "-------------------------------------------------"
        begin_game
    end

    def begin_game
        until @card_count > @deck.count
            puts "This is card number #{@card_count} out of #{@deck.count}."
            puts "Question: #{current_card.question}"
            user_guess = gets.chomp
            break if user_guess == 'exit'
            take_turn(user_guess)
        end
        end_game
    end

    def end_game
        puts '****** Game over! ******'
        puts "You had #{@number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct.to_s.sub(/0+$/, '').sub('.', '')}%."
        puts "#{@deck.cards[0].category} - #{percent_correct_by_category(@deck.cards[0].category).to_s.sub(/0+$/, '').sub('.', '')}% correct"
        puts "#{@deck.cards[1].category} - #{percent_correct_by_category(@deck.cards[1].category).to_s.sub(/0+$/, '').sub('.', '')}% correct"
        puts "#{@deck.cards[3].category} - #{percent_correct_by_category(@deck.cards[3].category).to_s.sub(/0+$/, '').sub('.', '')}% correct"
    end
end