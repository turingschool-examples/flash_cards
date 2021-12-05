class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category
  end
end
