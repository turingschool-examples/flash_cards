class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.length
  end 



end
