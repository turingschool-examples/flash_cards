class Round
  attr_reader :deck, :turns, :correct

  def initialize(deck)
    @turns = []
    @correct = 0
    @deck = deck
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    if new_turn.correct?
      @correct += 1
    end
    return new_turn
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.correct? && turn.card.category == category
        turn.card.category
      end
    end
  end

  def percent_correct
     number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / number_correct * 100
  end
end
