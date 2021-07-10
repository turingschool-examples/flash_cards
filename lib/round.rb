class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def current_card_index
    @turns.count + 1
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.card.category == category
        turn.correct?
      end
    end
  end

  def percent_correct
    (number_correct.fdiv(deck.count) * 100).round(0)
  end

  def percent_correct_by_category(category)
      (number_correct_by_category(category).fdiv(@deck.cards_in_category(category).count) * 100).round(0)
  end
end
