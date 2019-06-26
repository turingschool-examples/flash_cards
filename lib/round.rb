class Round
  attr_reader :deck

  def initialize (deck)
    @deck = deck
  end

  def take_turn (string)
    i = 0
    @guess = string
    @turn = Turn.new(@guess, @deck[i])
    i += 1
  end

  def turns

  end

  def currrent_card

  end

end
