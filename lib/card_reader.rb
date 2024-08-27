class Card_reader

  def initialize(deck_file)
    @deck_file = File.read(deck_file)
    @cards = []
  end

  def create_deck
    cards_as_string = @deck_file.split("\n")
    cards_as_string.each do |card_as_string|
      card_as_array = card_as_string.split(',')
      card = Card.new(card_as_array[0],card_as_array[1],card_as_array[2].intern)
      @cards << card
    end
    deck = Deck.new(@cards)
  end

end
