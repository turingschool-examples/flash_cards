class Round
  attr_reader :deck, :turns, :number_correct


  def initialize (deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[@turns.count]

  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @number_correct += 1 if turn.correct?
    turn
  end

  def number_correct_by_category(category)
    turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.count
  end

  def percent_correct
    (@number_correct.to_f / (turns.count) * 100).round
  end

  def percent_correct_by_category(category)
    percent = turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.count
    (percent.to_f / (turns.count) * 100).round
  end
end
