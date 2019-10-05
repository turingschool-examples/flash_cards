class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.delete_at(0)
    new_turn
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def percent_correct
    ((number_correct.to_f / @turns.count.to_f) * 100 ).floor(2)
  end

  def number_correct_by_category(category)
    sum = 0
    @turns.each do |turn|
      if turn.card.category == category
        sum += 1 if turn.correct?
      end
    end
    sum
  end

  def number_of_cards_by_category(category)
    @turns.count do |turn|
      category == turn.card.category
    end
  end

  def cards_in_discard
    @turns.map do |turn|
      turn.card
    end
  end

  def discard_pile_by_category(category)
    cards_in_discard.count do |card|
      card.category == category
    end
  end

  def percent_correct_by_category(category)
    correct_cat = number_correct_by_category(category).to_f
    discard_cat = discard_pile_by_category(category).to_f
    ((correct_cat/ discard_cat) * 100).floor(1)
  end
end
