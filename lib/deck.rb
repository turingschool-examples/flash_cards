class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

#needs testing, got tedious (gotta be a faster way then copy/paste)


  def cards_in_category(category)

    @categories = []

    @cards.each do |card|
      if card.category = category
        @categories << card.category
      end
    end

    @categories
  end


end
