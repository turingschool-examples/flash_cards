class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @turns_correct = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @turns_correct << turn
    end
    @deck.cards.rotate!
    turn
  end

  def number_correct
    @turns_correct.length
  end

  def number_correct_by_category(category)
    category_correct = @turns_correct.find_all do |turn|
      turn.card.category == category
    end
    category_correct.length
  end

  def percent_correct
    number_correct / @turns.length.to_f * 100
  end
end
