class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @card = @card
    # @cards = [cards]
    @cards = []
    @category = category
  end

  def cards
    @cards = []
    @cards << @card << @card << @card
  end

  def count
    p cards.count
  end

  def cards_in_category(category)
    p @cards
  end


end
