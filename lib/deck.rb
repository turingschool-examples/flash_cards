require './card.rb'
require './turn.rb'

card1 = Card.new("What is my name?", "Dylan", :Names)
card2 = Card.new("What is the capital of Colorado", "Denver", :Geography)
card3 = Card.new("What is 2 + 2", "4", :Math)

cards = [card1, card2, card2]

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

end

deck = Deck.new(cards)
p deck.count
