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
      deck.cards[0]
    end

    def take_turn(guess)
      turn = Turn.new(guess, self.current_card)
      @turns << turn
      @guesses << guess
      if @turns.length > 1
        deck.cards.rotate!
      end
      turn
    end

    def number_correct
      @turns.find_all do |turn|
        turn.correct?
      end.length
    end

    def number_correct_by_category(desired_category)
        correct_turns = @turns.find_all do |turn|
                        turn.correct?
                        end
        correct_turns.find_all do |turn|
          turn.card.category == desired_category
        end.length
    end

    def percent_correct
      decimal = self.number_correct / @turns.length
      decimal * 100.0
    end


    def percent_correct_by_category(category)
      decimal = self.number_correct_by_category(category) / deck.cards_in_category(category) 
      decimal * 100.0
    end

  end
