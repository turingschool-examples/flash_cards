require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :correct_guesses

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << current_card
    Turn.new(guess, current_card)
  end

  # def number_correct
  #   @correct_guesses.size
  # end


end
