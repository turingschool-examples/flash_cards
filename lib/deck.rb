class Deck
  attr_reader :deck, :cards
  def initialize(cards)
    @cards = cards
    @count = 0

  end

  def add(card_to_add)
    @cards << card_to_add
  end

  def contents()
    puts @cards
  end

  def count
    @count = @cards.count
  end

  def cards_in_category(category)
    cards_in_category = 0
    @cards.each.category  |category|
    cards_in_category += 1
    #card.category
  end

end

#binding.pry
