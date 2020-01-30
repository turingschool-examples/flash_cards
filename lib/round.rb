class Round

  attr_reader :deck, :turns, :card_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_count = 0
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end
end
