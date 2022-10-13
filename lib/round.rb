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
    Turn.new(guess, current_card)
  end 
end