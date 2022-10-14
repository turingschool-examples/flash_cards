# frozen_string_literal: true

# a round of multiple turns, one for each card in deck
class Round
  attr_reader :turns, :deck, :turn_count

  def initialize(deck)
    @deck = deck 
    @turns = [] 
    @turn_count = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turn_count += 1 
    @deck.cards.rotate!
    new_turn
  end 

  def number_correct
    @turns.select { |turn| turn.card.answer == turn.guess }.count 
  end

  def finished?
    deck.cards.count == turn_count 
  end
end
