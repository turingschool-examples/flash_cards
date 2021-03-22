class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.length
  end

  def categorize(subject)
    new_category = @cards.select do |card|
      card.category == subject
    end
    return new_category
  end

  def cards_in_category(subject)
    new_category = self.categorize(subject)
    return new_category.length
  end






end
