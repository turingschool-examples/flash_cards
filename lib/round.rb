class Round
  attr_reader :deck, :turns, :current_card, :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
    @current_card = deck.cards[0]
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.shift
    new_turn
  end

  def correct?
    guess == new_card.answer
  end

  def number_correct
    turns.find_all do |turn|
      turn.correct?
    end
    correct_turns.count
  end

  def count
    @round.turns.count
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.correct? && turn.card.category == category
    end
    turns.count
  end

  def percent_correct
    (number_correct / turns.count.to_f) * 100
  end

  def cards_in_category(category)
    turns.find_all do |turn|
      turn.card.category == category
    end
    turns.count
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / cards_in_category(category).to_f) * 100
  end
end
