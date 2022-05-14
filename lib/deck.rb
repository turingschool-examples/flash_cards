class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def cards_in_category(thing)
    card_category = []
    cards.each do |card|
      if card.category == thing
        card_category << card
      else
      end
    end
    card_category
  end

  

end
