require './lib/card'

class CardGenerator

  attr_accessor :filename, :card_deck

  def initialize(filename)
    @filename = filename
    @card_deck = []
  end

  def cards
    File.open(@filename, "r")
    line = IO.readlines(@filename)[0].strip.split(",")

    new_card = Card.new(line[0], line[1], line[2])


    # # do this 4 times
    # @card_deck << Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Deck.new(card_deck)
  end
end
