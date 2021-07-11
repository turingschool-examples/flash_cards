require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    next_turn = Turn.new(guess, current_card)

    @turns << next_turn
    next_turn
  end

  def number_correct
    correct_guesses = []

    @turns.each do |turn|
      if turn.correct? == true
        correct_guesses << turn
      end
    end

    correct_guesses.count
  end

end
