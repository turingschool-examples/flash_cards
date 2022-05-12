class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    # @filename
    contents = File.read(@filename)
    p contents
    array = contents.split("\n")
    # turn each content into a string

    # do this 4 times
    Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Deck.new(card_deck)
  end
end
