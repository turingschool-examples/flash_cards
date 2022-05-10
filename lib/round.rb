require 'pry'

class Round
    attr_reader :deck, :turns, :correct_answer
    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first 
    end

    def take_turn(guess)
        @turns << Turn.new(guess, current_card)
        @deck = @deck.cards.rotate(1)
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
        (number_correct_by_category(input) / @turns.count.to_f)*100
    end
end