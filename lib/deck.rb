require './turn.rb'
require './card.rb'

class Deck
attr_reader :cards

 def initialize
 @cards = []
 end

 def add_card_to_deck(card)
 @cards << card
 end

 def count
 p cards.count
 end

 def cards_in_category
   #return the cards that fall into the called category
 end

end
