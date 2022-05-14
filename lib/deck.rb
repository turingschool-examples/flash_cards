class Deck
  attr_reader :cards, :count
  def initialize (cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(category)
    same_cat = []
    @cards.each do |card|
      if card.category == category
        same_cat << card
      end
    end
    same_cat

  end

end
