class Deck

  attr_reader :cards,
              :count

  def initialize(cards)
    @cards = cards
    @count = count
  end

  def add_cards(card)
    @cards << card
  end

  def count
    @cards.length
  end

end
