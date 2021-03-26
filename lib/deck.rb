class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def categorize(subject)
    category = @cards.select do |card|
      card.category == subject
    end
  end 

end
