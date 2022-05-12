require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'



class Round

  attr_reader :deck, :turns, :turn_count,:number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count = 0
    @number_correct = 0
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    @turn_count += 1
    new_turn = Turn.new(guess,current_card)

    if new_turn.guess == new_turn.card.answer
      increment_number_correct
    end

    @turns << new_turn
    new_turn
  end

  def correct?

    take_turn.guess == take_turn.answer

  end

  def increment_number_correct
    @number_correct += 1
  end

end
