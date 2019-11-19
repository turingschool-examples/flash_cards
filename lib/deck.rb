class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category_name)
    @cards.each do |card|
      if category_name == card.category
        "#{card}"
      end
    end
  end
end
