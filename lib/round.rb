class Round
  attr_accessor :deck, :turns, :cards, :category

  def initialize(deck)
    @deck = deck
    @turns = []
    @cards = cards
    @category = category
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    turns.last
  end

  def current_card
    deck.cards[turns.count]
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(chosen_category)
    turns.count do |turn|
      turn.correct? && turn.card.category == chosen_category
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / @deck.cards_in_category(category).length.to_f) * 100).round
  end

end
