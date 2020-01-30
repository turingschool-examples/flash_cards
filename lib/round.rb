require './lib/turn'
class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_turn
    @correct_count = 0
  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    @current_turn = Turn.new(guess, current_card)
    @turns << @current_turn
    @current_turn
  end

  def number_correct
    if @current_turn.correct?
      @correct_count += 1
    end
    @correct_count
  end
end
