require './lib/card'
require './lib/deck'

# Documentation for class Deck
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    num_of_cards = 0
    @cards.each do |card|
      num_of_cards += 1 if card.category == category
    end
    num_of_cards
  end
end

card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card2 = Card.new(
  'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
)
card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west',
                 :STEM)

cards = [card1, card2, card3]

deck = Deck.new(cards) # rubocop:disable Lint/UselessAssignment
