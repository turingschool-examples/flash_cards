require 'pry'
require_relative'./deck'
require_relative'./turn'
require_relative './card'

class Round
    attr_reader :deck, :turns, :correct_answer
    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card; @deck.cards.first end

    def take_turn(guess)
        @turns << Turn.new(guess, current_card)
        @deck.cards = @deck.cards.rotate(1)
        @turns.last
    end

    def number_correct
        @correct = 0
        @turns.each do |turn|
            @correct += 1 if turn.correct? == true
        end
        @correct
    end

    def number_correct_by_category(input)
        @correct_by_category = 0
        @turns.each do |turn|
            if turn.card.category == input
                if turn.card.answer == turn.guess
                    @correct_by_category += 1
                end
            end
        end
        @correct_by_category
    end 

    def percent_correct; (number_correct / @turns.count.to_f)*100 end

    def percent_correct_by_category(input)
        total_by_category = 0
        @turns.each do |turn|
            total_by_category += 1 if turn.card.category == input
        end
        (number_correct_by_category(input) / total_by_category.to_f)*100
    end

    def start
        puts "Welcome! You're playing with 4 cards. \n--------------------------------------"
        counter = 0
        card_count = deck.count
        until turns.count == deck.count do
            puts "This is card number #{counter += 1} out of #{card_count}."
            puts "Question: #{current_card.question}"
            guessing = gets.chomp
            take_turn(guessing)
            puts turns.last.feedback
        end
        if turns.count == deck.count
            puts "****** Game over! ******"
            puts "You had #{number_correct} correct guesses out of #{card_count} for a total score of #{percent_correct.to_i}%."
            turns.each do |turn|
                puts "#{turn.card.category}- #{percent_correct_by_category(turn.card.category).to_i}% correct"
            end
        end
    end

 # puts "#{turn.card.category}- #{percent_correct_category(turn.card.category)} correct"
end