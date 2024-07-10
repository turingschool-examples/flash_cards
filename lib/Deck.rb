require_relative 'card'
#Found this method while looking for ways to just pull from other files and I'll be using it

class deck
  attr_reader :cards
#Calling the class Deck and setting up this files attr_reader

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def shuffle_cards
    @cards.shuffle!
  end

  def draw_card
    @cards.pop
  end
end

# Now the deck is set