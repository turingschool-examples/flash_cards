# frozen_string_literal: true

# a round of multiple turns, one for each card in deck
class Round
  attr_reader :turns

  def initialize(deck)
    @deck = deck 
    @turns = [] 
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift 
    return new_turn
  end 
end