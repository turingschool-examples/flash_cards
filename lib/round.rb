require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'
class Round
    attr_reader :deck,
                :turns
    def initialize(deck)
      @deck = deck
      @turns = []

    end

    def current_card
      deck.cards.rotate
    end

    def take_turn(guess)
      turn = Turn.new(guess, self.current_card)
      @turns << self.current_card
      turn
    end

    def number_correct

    end

  end
