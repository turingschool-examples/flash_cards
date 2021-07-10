class Round
  attr_reader :deck,
              :turns,
              :number_correct,
              :order

  def initialize(deck)
    @deck           = deck
    @turns          = []
    @number_correct = 0
    @order          = 0
  end

  def current_card
    @turns.length
    @deck.cards[order]
  end

  def take_turn(guess)
    turn_store = Turn.new(guess, current_card)
    @turns.push(turn_store)
    if turn_store.correct?
      @number_correct += 1
    end
    @order +=1
    turn_store
  end

  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.guess == turn.card.answer
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
  end
end
