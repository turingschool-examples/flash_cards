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
    @turns << new_turn
    @turns.last
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category
  end

  def percent_correct
  end

  def percent_correct_by_category
  end

end
