class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
    #@deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns.push(turn)
    #@deck.cards.shift
    turn
  end

  def number_correct
    @turns.find_all do |turn|
      turn.correct?
    end.length
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.length
  end

  def percent_correct
    # May not need 'self.'
    ((number_correct * 100.0) / @turns.count).round(1)
  end

  def percent_correct_by_category(category)
    total_cards_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end.length
    ((number_correct_by_category(category) * 100.0) / total_cards_in_category).round(1)
  end
end
