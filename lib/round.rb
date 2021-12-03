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
    new_turn = Turn.new(guess, current_card)
    if current_card.answer == guess
      @correct_guesses << current_card
    end
    @turns << new_turn
    deck.rotate
    new_turn
  end

  def number_correct
    @correct_guesses.size
  end




end
