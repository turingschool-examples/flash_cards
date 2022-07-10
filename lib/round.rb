require './lib/deck'


class Round

attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
      @turns << new_turn
      if new_turn.correct?
        @number_correct += 1
      end
    @deck.cards.shift    new_turn
  end

  def number_correct_by_category(card_category)
    category_count = 0
    @turns.each do |turn|
      if turn.card.category == card_category && turn.correct?
        category_count += 1
      end
    end
    category_count
  end

  def percent_correct
    (number_correct.to_f / turns.count) * 100
  end

  def percent_correct_by_category(card_category)
    category_total = 0
    @turns.each do |turn|
      if turn.card.category == card_category
        category_total += 1
      end
    end
    category_total
    (number_correct_by_category(card_category)/category_total) * 100.0
  end

end
