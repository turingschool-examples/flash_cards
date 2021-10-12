class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    amt_correct = @turns.find_all do |turn|
      turn.correct?
    end
    amt_correct.length
  end
end
