class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end



   def count
     cards.count
   end

   def add_cards(card)
     @cards << card
   end

   def cards_in_category(name)
    cards.select do |card|
      card.category == name
    end
   end

  # def cards_in_category(name)
  #   category_cards = []
  #   cards.each { |card| category_cards << card if card.category == name }
  #   category_cards
  # end

end
