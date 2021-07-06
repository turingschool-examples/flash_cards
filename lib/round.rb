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
    turn = Turn.new(guess, current_card)
    @turns << turn
    next_card
    return turn
  end

  def next_card
    top_card = @deck.cards.shift
  end

  def number_correct
    @turns.count do |turn|
      turn.card.answer == turn.guess
    end
  end
end
