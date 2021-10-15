class Deck
  attr_reader :cards, :categories

   def initialize(cards)
     @cards = cards
     @categories = categories

   end

   def count
     cards.count
   end

   def cards_in_categories
     cards
   end

   # Here inside the deck we can rotate
   # the cards.
   # Does that make sense?
   def rotate
     @cards = @cards.rotate
   end



   end
