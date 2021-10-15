class Deck
   attr_reader :cards

  def initialize(cards)
   @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(genre)
    correct_cards = []
    @cards.each do |card|
      if card.category == genre
         correct_cards << card
      end
    end
    correct_cards
  end
end
 
