class Deck
  attr_reader :cards, :categories

  def initialize(cards)
    @cards = cards
    @categories = []

  end

  def count

  end

  def add.categories
    @cards.each do |card|
      @categories << card.category
    end
  end

end
