class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @turns = 0
  end

  def take_turn(response)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new(response, card)
  end



#need attributes for: turns, current card, number correct,

#need methods for: take turn

end
