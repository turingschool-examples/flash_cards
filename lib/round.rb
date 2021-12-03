class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @true_turn = []
  end

  def current_card
    @deck.select do |card|
      return [card]
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
     @turns << new_turn
     end
  end
end
