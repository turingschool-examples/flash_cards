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
      deck.cards[count]
    end

    def take_turn(guess)
      #turns = Turn.new("Juneau", current_card)
      #@deck.cards.shift
      turn = Turn.new(guess, current_card)
      @turns << turn
      @count += 1
      turn
              require "pry"; binding.pry
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

end
