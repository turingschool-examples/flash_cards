class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.count
    #is this really what they want? Re interaction pattern
  end

  def cards_in_category(category)

  end

end
