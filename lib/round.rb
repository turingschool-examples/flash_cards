class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count = 0
  end

  def current_card
    @deck.cards[@turn_count]
  end

  def take_turn(answer)
    new_turn = Turn.new(answer, @deck.cards[@turn_count])
    @turns << new_turn
    @turn_count += 1
    return new_turn
  end

end
