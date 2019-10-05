class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  # revisit this method later and visualize!!!!
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    cat_correct = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    cat_correct.count
  end
end
