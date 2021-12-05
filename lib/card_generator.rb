# file_to_import = "cards.txt"
# filename = cards.txt.readlines.map(&:chomp)

class CardGenerator(file_to_import)
  attr_reader :file_to_import

  def initialize(cards, array_of_cards)
    @cards = cards
    @array_of_cards = []
  end

  def generate_cards(file_to_import)
  cards = file_to_import.readlines.map(&:chomp)
  cards.each do |card|
    card_to_create = Card.new(card)
    @array_of_cards << card_to_create
  end

  def generate_deck(array_of_cards)
    @deck = Deck.new(array_of_cards)
  end


end
