require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'
class Round
    attr_reader :deck,
                :turns,
                :guesses
    def initialize(deck)
      @deck = deck
      @turns = []
      @guesses = []
    end

    def current_card
      deck.cards[@turns.length]
    end

    def take_turn(guess)
      turn = Turn.new(guess, self.current_card)
      @turns << turn
      @guesses << guess
      #if @turns.length > 1
      #  deck.cards.rotate!
      #end
      turn
    end

    def number_correct
      @turns.count do |turn|
        turn.correct?
      end
    end

    def number_correct_by_category(desired_category)
        correct_turns = @turns.find_all do |turn|
                        turn.correct?
                        end
        correct_turns.count do |turn|
          turn.card.category == desired_category
        end
    end

    def percent_correct
      self.number_correct.to_f / @turns.length.to_f * 100.0

    end


    def percent_correct_by_category(category)
      self.number_correct_by_category(category).to_f / deck.cards_in_category(category).to_f * 100

    end

  end
