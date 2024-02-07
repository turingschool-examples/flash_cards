class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    if turn.correct?
      @number_correct += 1
    end
    @turns << turn
    turn
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    ((@number_correct.to_f / @turns.count) * 100).round(2)
  end

  def percent_correct_by_category(category)
    number_correct = 0
    cards_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct += 1
      end
    end
    @turns.each do |turn|
      if turn.card.category == category
        cards_by_category += 1
      end
    end
    ((number_correct.to_f / cards_by_category) * 100).round(2)
  end
end
