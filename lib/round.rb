require 'pry'

class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck 
        @turns = []
    end

    def current_card
        @deck.cards.first
    end 

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.shift 
        new_turn 
    end

    def number_correct
        correct_count = 0

        @turns.each do |turn|
          if turn.correct?
            correct_count += 1
          end 
        end
        correct_count
    end

    def turn_count #refactored these names for clarity and consistency, I believe this is an example of Law of Demeter 
        @turns.count
    end

    def last_turn 
        @turns.last
    end
end