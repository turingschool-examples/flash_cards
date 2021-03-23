class Turn
  attr_reader :guess, :card
  def initialize (guess, card)
    @guess = guess
    @card = card
  end
end
turn = Turn.new("Juneau", card)
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
