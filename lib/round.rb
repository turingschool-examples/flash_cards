# require 'colorize'

class Round
    attr_reader :deck, :turn, :turns

    def initialize(deck)
        @deck = deck
        @card = @deck.cards.first
        @turns = []
    end

    def start
        puts "Welcome! You are playing with #{@deck.cards.length+1} cards."
        puts ">-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<".red
        @deck.cards.length.times do |i|
            puts "This is card #{i+1} out of #{@deck.cards.length}"
            puts "Question: #{@card.question}".yellow
            take_turn(gets.chomp)
        end
        game_over
    end

    def take_turn(guess)
        @turn = Turn.new(guess, current_card)
        @turns << @turn
        @turn.feedback
        @card = @deck.cards[@deck.cards.index(@card)+1]
    end

    def current_card
        @card
    end

    def number_correct
        @turns.select{|turn| turn.correct?}.length
    end

    def number_correct_by_category(category)
        t = @turns.select{ |turn| turn.correct?}
        t.select{|turn| turn.card.category == category}.length
    end

    def percent_correct
        (number_correct.to_f / turns.length.to_f) * 100
    end

    def percent_correct_by_category(category)
        l = @turns.select{|turn| turn.card.category == category}.length
        (number_correct_by_category(category).to_f / l.to_f) * 100
    end

    def game_over
        puts "_-_-_-_-_-|Game Over|-_-_-_-_-_"
        puts "You had #{number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct.round(2)}%".green
        @deck.categories.each do |cat|
            puts "#{cat} - #{percent_correct_by_category(cat)}%"
        end
        
    end
end