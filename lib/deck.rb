class Deck
  attr_reader :cards, :category

  def initialize(cards = [])
    @cards    = cards
  end

  def cards_in_category(category)
    cards_in_same_category = []

    cards.each do |card|
      if category == card.category
        cards_in_same_category << card
      end
    end
      cards_in_same_category
  end

end
