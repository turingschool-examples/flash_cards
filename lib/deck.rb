class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @cards = cards
    @category = category

  end

  def count
    return @cards.count
  end

  def cards_in_category(cat)
    if cat == :STEM
      return cards[1,2]

    elsif cat == :Geography
      return cards[0]

    else
       return []
    end

  end
end
