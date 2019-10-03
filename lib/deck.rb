require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards_witin_category = []
    @cards.each do |card|
      if card.category == category
        cards_witin_category << card
      end
    end
    cards_witin_category
  end

end

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("Who was the first woman to win a Noble Prize?", "Marie Curie", :STEM)
card3 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)
card4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card5 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

#create variable with empty array and shovel in Card instances
cards =[]

cards << card1
cards << card2
cards << card3
cards << card4
cards << card5

deck = Deck.new(cards)
deck.count
p deck.count
p deck.cards_in_category(:Geography)
p deck.cards_in_category(:STEM)
p deck.cards_in_category("Pop Culture")
