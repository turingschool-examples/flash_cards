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

  def percent_correct_by_category
    results = Hash.new()

    @turns.each do |turn|
      if !results.include?(turn.card.category)
        results[turn.card.category] = [0.0, 1.0]
      else
        results[turn.card.category][1] += 1
      end
      results[turn.card.category][0] += 1 if turn.correct?
    end
    results.transform_values {|result| ((result[0] / result[1]) * 100).round}
  end
end
