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
    turn = Turn.new(guess,current_card)
    @turns << turn
    @deck.cards.shift
    turn
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
    (number_correct.to_f/@turns.length) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f/@turns.count do |turn|
      turn.card.category == category
    end)* 100
  end
end
