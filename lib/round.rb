class Round
  attr_reader :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.length]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @turns.last
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count do |turn| 
      turn.card.category == category && turn.correct?
    end
  end
end