class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(cat)

    @cards.each do |deck_card|
      deck_card.compare(false)
    end

  end

##### TRY AGAIN
  def cards_cat(ask)
    ask == :cat1
  end

  def count
    @cards.length
  end

  def shift
    @cards.shift
  end

end
