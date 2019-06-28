# Desk class outline template


class Deck

  attr_reader :cards
#creates an array of Card objects with attributes
#create a new class called deck that takes in an array when initialize
#assuming cards is array.
  def initialize (cards)
    @cards = cards
  end

  #def add_card(card)
    #@cards << card
  #end

#returns the number of cards in a deck
  def count
    cards.count
  end

#returns a number of cards in a category
  def cards_in_category(category)

    #look up select method instead of do
    cards.select {|card| ategory == card.category}

    cards.each do |card|
      if category == card.category
        card_with_same_category << cards
      end
    end
  end

end
