require './lib/card'

class CardGenerator

  attr_accessor :card_deck

  def initialize(filename)
    @filename = filename
    @card_deck = []
  end

  def cards
    # @filename
    
    contents = File.read(@filename)
    p contents
    array = contents.split("\n")
    # turn each content into a string

    # do this 4 times
    @card_deck << Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Deck.new(card_deck)
  end
end
