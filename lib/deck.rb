
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category = @cards.card_2
    category
  end
end #end class


deck = Deck.new(cards)
card_1 = Card.new("what is the capital of Alaska?","Juneau",:Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
                  reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5°
                  clockwise from due north?", "North north west", :STEM)
