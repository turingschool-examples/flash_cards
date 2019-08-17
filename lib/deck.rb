#implements Deck class

class Deck

     attr_reader    :cards

     def initialize(cards)
       @cards    = cards
     end

     def count
          @cards.length
     end

     # implements .each version of cards_in_category method
     # def cards_in_category(cat)
     #      a = []
     #      @cards.each do |card_in_deck|
     #           # puts card_in_deck
     #           if card_in_deck.category == cat
     #                a << card_in_deck
     #           end
     #      end
     #      a
     # end

     def cards_in_category(cat)
          @cards.find_all { |card_in_deck| card_in_deck.category == cat}
     end

end
