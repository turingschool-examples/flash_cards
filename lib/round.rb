require './lib/turn'
class Round
  attr_reader :deck, :turns, :correct_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turn = []
  end

  def current_card
    deck.cards.shift
    # @deck.select do |card|
    #   return [card]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @turns.last
  end

  def correct?
    if take_turn(guess)
      new_turn = round.take_turn("Juneau")
      new_turn.correct?
    end
  end
end
