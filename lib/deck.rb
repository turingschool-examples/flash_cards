#implements Deck class

class Deck

     attr_reader    :cards

     def initialize(cards)
       @cards    = cards
     end

     def count()
          @cards.length
     end

     # def cards_in_category(cat)
     #      a = []
     #      @cards.each { |x|
     #           if x.category == cat
     #                a << x
     #           end
     #      }
     #      a
     # end

     def cards_in_category(cat)
          @cards.find_all { |x| x.category == cat}
     end

end

require './lib/card.rb'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

deck.cards

deck.count

p "in :STEM"
deck.cards_in_category(:STEM)
p "in :Geography"
deck.cards_in_category(:Geography)
p "in Pop Culture"
deck.cards_in_category("Pop Culture")
