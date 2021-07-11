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
    by_cat = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    by_cat.length
  end

  def percent_correct
    Integer((@number_correct.to_f / @turns.length) * 100)
  end

  def percent_correct_by_category(category)
    pct_cat = @turns.find_all do |turn|
      turn.card.category == category
    end
    pct_cat_correct = pct_cat.find_all do |turn|
      turn.correct?  && turn.card.category == category
    end
    Integer((pct_cat_correct.length.to_f / pct_cat.length.to_f) * 100)
  end
end
