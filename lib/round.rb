class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def deck
    return @deck
  end

  def turns
    return []
  end
end
