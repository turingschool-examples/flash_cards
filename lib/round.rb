require './lib/turn'
require 'pry'

class Round
    attr_reader :deck, :turns, :cards, :number_correct
    
    def initialize (deck)
        @deck = deck
        @cards = cards
        @turns = []
        @number_correct = 0
        @correct_turns = 0

    end

    def current_card
        deck.cards[0]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        if guess == current_card.answer
            @number_correct += 1 
        end
        deck.cards.rotate!
        return turn
    end

    def number_correct_by_category(category)

        @correct_turns = turns.select do |turn|
           turn.card.category == category && turn.correct?
        end

        return @correct_turns.count
    end

    def percent_correct
     (@number_correct / turns.count.to_f) * 100
    end

    def percent_correct_by_category(category)
        (@correct_turns / turns.count.to_f) * 100
    end
end


#syntax below for user input, taken from def initialize.
# puts "Hello"
    # input = gets.chomp
    # puts input + "!!!"

# Round.new(nil)