class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = generate
  end

  def generate
    some_cards = []
    deck_of_cards = []
    File.open(@filename).each do |line|
      some_cards << line.chomp.split(',')
    end
    some_cards.each do |card|
      deck_of_cards << Card.new(card[0], card[1], card[2])
    end
    return deck_of_cards
  end
end
