class Round
attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.find_all do |turn|
      turn.correct?
    end.length
  end

  def number_correct_by_category(category)
    correct_by_cat = []
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
      correct_by_cat << turn
      end
    end
    correct_by_cat.length
  end

  def percent_correct
    (number_correct / @turns.length.to_f * 100).round(1)
  end

  def number_of_cards_by_category(category)
    card_number = 0
    @turns.each do |turn|
      if turn.card.category == category
        card_number += 1
      end
    end
    card_number
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / number_of_cards_by_category(category) * 100
  end
end
