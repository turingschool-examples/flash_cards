class Round
  attr_accessor :deck, :turns, :cards, :guess, :answer
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate!(1)
    @turns.last
  end

  def number_correct
    turns.count{ |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    ((number_correct.to_f / @turns.count.to_f) * 100).round
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / @deck.cards_in_category(category).length.to_f) * 100).round
  end
end
