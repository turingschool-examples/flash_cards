class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards.shift
    turns.last
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (number_correct.to_f / turns.length.to_f) * 100
  end

  def turns_per_category(category)
    turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_per_category(category).to_f) * 100
  end

end
 
