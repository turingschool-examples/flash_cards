class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
       turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.size * 100)
  end

  def percent_correct_by_category(category)
    category_data = @turns.count do |turn|
      turn.card.category == category
    end
      (number_correct_by_category(category).to_f / category_data) * 100
  end
end
