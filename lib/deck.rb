class Deck
  attr_reader :cards, :deck

  def initialize(cards)
    @card = cards
  end

  def count
    @cards.count
  end



end
