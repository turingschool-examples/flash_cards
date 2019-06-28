class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    created_turn = Turn.new(guess, current_card)
    @turns << created_turn
    created_turn
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct += 1
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    @turns.select{|turn| turn.card.category == category && turn.correct?}.count
  end

  def percent_correct
      (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.select{|turn| turn.card.category == category}.count.to_f * 100)
  end
end
