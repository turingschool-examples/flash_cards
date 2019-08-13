#implements Deck class

class Deck

     def initialize(cards)
       @cards    = []
     end

     def count(cards)
          cards.length
     end

     def cards_in_category(category)
          cards.each {a << cards.category == category}
          end
     end

end
