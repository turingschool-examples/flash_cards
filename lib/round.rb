class Round
  attr_reader :deck,
              :turns,
              :count

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 1
  end

  def current_card
    deck.cards[@count - 1]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    # deck.cards.shift
    @count +=1
    turns.last
  end

  def number_correct
    turns.find_all do |turn|
      turn.card.answer == turn.guess
    end.size
  end

  def number_correct_by_category(category)
    turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.size
  end

  def percent_correct
    ((number_correct.to_f / turns.size) * 100).round
  end

  def percent_correct_by_category(category)
    by_category_count = turns.select do |turn|
      turn.card.category == category
    end.size
    (number_correct_by_category(category).to_f / by_category_count) * 100
  end
end
