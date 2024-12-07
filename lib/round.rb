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

    def turn_count #refactored these names for clarity and consistency, I believe this is an example of Law of Demeter 
        @turns.count #previously was def count, @rounds.turns.count (in spec file)
    end

    def last_turn #previously was def last, @round.turns.last (in spec file)
        @turns.last
    end

    def number_correct #need to test for more options, even if it's working in runner
        correct_count = 0

        @turns.each do |turn|
          if turn.correct?
            correct_count += 1
          end 
        end
        correct_count
    end

    def correct_by_category(category)
        correct_by_cat_count = 0

        @turns.each do |turn|
            if turn.correct? && turn.card.category == category
                correct_by_cat_count += 1
            end
        end
        correct_by_cat_count
    end

    def percent_correct
       (number_correct / turn_count.to_f) * 100
    end

    def percent_correct_by_category(category)
        count_by_cat = 0
        @turns.each do |turn|
            if turn.card.category == category 
                count_by_cat += 1
            end
        end
        (correct_by_category(category) / count_by_cat.to_f) * 100
    end
end