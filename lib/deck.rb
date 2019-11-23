class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  # call back to card file to use @category ???
  def cards_in_category(category)
    @category = category
    @cards_pile = []

    @cards.each do |card|
      if card.category == @category
        @cards_pile << card
      end
    end

    @cards_pile # <--- cards captured
  end

end
