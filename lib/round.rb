class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
  end

  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    correct_answers = @turns.find_all do |turn|
      turn.correct?
    end
    correct_answers.length
  end

  def number_correct_by_category(category)
    correct_answers_by_category = @turns.find_all do |turn|
      turn.correct? && turn.card.category == category
    end
    correct_answers_by_category.length
  end

  def percent_correct
    ((number_correct.to_f/@turns.length) * 100).round
  end

  def number_of_cards_by_category(category)
    cards_by_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    cards_by_category.length
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f/number_of_cards_by_category(category)) * 100).round
  end
end
