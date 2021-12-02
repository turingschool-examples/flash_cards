class Deck
  attr_reader :deck, :cards
  def initialize()
    @cards = []
  end

  def add(card_to_add)
    @cards << card_to_add
  end

  def contents()
    puts @cards
  end
end
#binding.pry
