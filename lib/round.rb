class Round
  attr_reader :deck, :turns, :number_correct, :flip

  def initialize(deck)
    @deck = deck
    @turns = []
    @flip = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@flip]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @number_correct += 1 if new_turn.feedback == "Correct"
    @turns << new_turn
    @flip += 1
    new_turn
  end

  def number_correct_by_category(category)
    @turns.count { |turn|
      turn.card.category == category && turn.feedback == "Correct"
    }
  end

  def percent_correct
    p 0 if @number_correct == 0
    ((@number_correct.to_f / @turns.length) * 100).round
  end

  def percent_correct_by_category(category)
    p 0 if @number_correct == 0

    total_category = turns.count { |turn|
      turn.card.category == category
    }

    correct = number_correct_by_category(category)
    ((correct / total_category.to_f) * 100).round
  end
end
