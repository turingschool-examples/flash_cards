class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @card = @card
    # @cards = [cards]
    @cards = []
    @category = category
  end

  def cards
    @cards << @card
  end

  def count
    p @cards.count
  end


end
