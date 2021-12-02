class Deck
  attr_reader :deck, :cards
  def initialize()
    @cards = []
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

end

#binding.pry
