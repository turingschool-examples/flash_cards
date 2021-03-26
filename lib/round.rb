require './lib/turn'

class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = identify_correct.count
  end

  def current_card
    # deck.cards.first
    deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def identify_correct
    @turns.map do |turn|
      turn.correct?
    end
  end

  def counter
    @number_correct = identify_correct.count
  end


end
