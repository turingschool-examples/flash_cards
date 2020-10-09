class CardGenerator
  attr_reader :deck

  def initialize(filename)
    @filename = filename
    @card_data = []
    @deck = Deck.new([])
  end

  def process_cards_file
    card_data = File.open(@filename)
    @card_data = card_data.readlines.map(&:chomp)
  end

  def cards
    process_cards_file
    @card_data.each do |card|
      card = card.split(',')
      @deck.cards << Card.new(card[0], card[1], card[2])
    end
    @deck
  end
end
