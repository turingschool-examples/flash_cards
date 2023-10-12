require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'

class Round
    attr_reader :deck, :turns, :number_correct
    def initialize(deck_input)
        @deck = deck_input # Deck.new(deck_input)
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.append(new_turn)
        @deck.cards.shift
        new_turn
    end

    def number_correct
        num = 0
        @turns.each { |turn|
            if turn.correct?
                num = num + 1
            end
        }
        num
    end

    def number_correct_by_category(category)
        num = 0
        @turns.each { |turn|
            if turn.card.category == category
                if turn.correct?
                    num = num + 1
                end
            end
        }
        num
    end

    
    def number_by_category(category)
        num = 0
        @turns.each { |turn|
            if turn.card.category == category
                num = num + 1
            end
        }
        num
    end

    def percent_correct
        per_correct = number_correct.to_f / @turns.count().to_f
        per_correct*100
    end

    def percent_correct_by_category(category)
        per_correct = number_correct_by_category(category).to_f / number_by_category(category).to_f
        per_correct*100
    end
end