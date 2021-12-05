require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns_array, :round, :new_turn, :current_card

  def initialize(deck)
    @deck = deck
    @turns_array = []
    @number_correct = 0
  end

  def deck
    return @deck
  end

  def turns
    @turns_array
  end

  def current_card
    current_card = @deck.cards.first
    current_card
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns_array << new_turn
    deck.cards.rotate!(1)
    @turns_array.last
  end

  def number_correct
    @turns_array.count do|turn|
      turn.correct?
    end
  end

  def count
    @turns_array.count
  end
end
