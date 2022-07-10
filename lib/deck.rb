require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards) #create new Deck from an array of cards
    @cards = cards
  end

  def card_at(index) #retrive a specific card from its index
    @cards[index]
  end

  def count #count number of cards in a deck
    @cards.count
  end

  def cards_in_category(category) #return array cards of specific category in a deck
    tally = [] #create empty local storage array
    @cards.each do |card| 
      if (card.category == category) #search through a Deck for cards that have same category symbol as was passed in
        tally << card  #shovel matching cards into array
      end
    end
    tally #return array filled w cards
  end
end