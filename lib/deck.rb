
class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = []
  end

  def add_card(new_card)
    cards << new_card
  end

  def display_cards
    puts cards
  end

  def choose_card
    return cards[rand(0..(cards.length - 1))]
  end

end         
