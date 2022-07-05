require './lib/card.rb'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]



class Deck

  def initialize(cards)
    @cards = cards
  end

  def cards
    return @cards
  end

  def count
    return cards.count
  end

  def cards_in_category(category)
    @category = category
    tally = []
    cards.each do |num|
      if (num.category_quiet == @category)
        tally.push(num)
      end
    end
    p tally
  end
end

deck = Deck.new(cards)
deck.cards_in_category(:STEM)
card_1.answer
