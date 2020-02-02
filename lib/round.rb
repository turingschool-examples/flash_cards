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
    @deck.cards.shift
    turn
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct = num_correct + 1
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num_correct = num_correct + 1
      end
    end
    num_correct
  end

  def percent_correct
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        num_correct = num_correct + 1
      end
    end
    perc_correct = (num_correct / @turns.length) * 100
    perc_correct.round(2)
  end

  def total_cards_per_category(category)
    total_cards = turns.find_all do |turn|
      turn.card.category == category
    end
    total_cards
  end

  def percent_correct_by_category(category)
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct? && (turn.card.category == category)
        num_correct += 1.0
      end
    end
    num_correct
    (num_correct / total_cards_per_category(category).length * 100).round(2)
  end
end
