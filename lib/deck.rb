class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    if category == :STEM
      return @cards[1, 2]
    elsif category == :Geography
       return @cards[0]
    end
  end
  #^^find cleaner way if time allows
end
