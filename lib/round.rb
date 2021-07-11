require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns, :count

    def initialize(deck)
      @deck = deck
      @turns = []
      @count = 0
    end

    def current_card
      @deck.cards[count]
    end

    def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      @count += 1
      turn
    end

    def number_correct
      count_of_correct_turns = 0

      @turns.each do |turn|
        if turn.correct? == true
          count_of_correct_turns += 1
        end
      end
        count_of_correct_turns
    end

    def number_correct_by_category(category)
      correct_count = 0
      @turns.each do |turn|
        if turn.correct? == true && turn.card.category == category
          correct_count = correct_count + 1
        end
      end
      correct_count
    end

    def percent_correct
      division_to_integer  = (number_correct.to_f / @count)
      ((number_correct.to_f / @count) * 100).to_i
    end

    def percent_correct_by_category(category)
      # if there are no cards of that category in that deck
      # return 0.0
      if deck.cards_in_category(category).length == 0
        return 0.0
      end 
      ((number_correct_by_category(category) / deck.cards_in_category(category).length) * 100).to_f
    end
end
