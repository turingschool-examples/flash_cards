class CardGenerator
  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def process_cards_file
    cards_data = File.open(@filename)
    @cards = cards_data.readlines.map(&:chomp)
  end
end
