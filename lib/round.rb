require 'pry'

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
        card_count
        puts "Question: #{current_card.question}"
        # turn.guess = gets.chomp
        # turn.feedback
    end

    def card_count
        counter = deck.count
        x = turns.count
        x += 1 if x == 0
        puts "This is card number #{x} out of #{counter}."
    end

end