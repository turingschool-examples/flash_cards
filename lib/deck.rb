class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category_name)
    @cards.each do |card|
      if card.category == category_name
        "#{card}"
      end
    end
  end

end
