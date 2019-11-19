class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    result = @turns << new_turn
    @deck.cards.shift
    result
  end

  def number_correct
    @turns.count do |turn|
      turn.guess == turn.card.answer
    end
  end
end
