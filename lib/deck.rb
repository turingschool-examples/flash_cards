class Deck
  attr_reader :cards, :count
  def initialize (cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(category)
    same_category = []
    @cards.each do |card|
      if card.category == category
        same_category << card
      end
    end
    same_category

  end

end
