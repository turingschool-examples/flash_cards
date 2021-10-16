class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open(@filename)
    file_data = file.read
    cards = file_data.split("\n")
    cards.map do |card|
      formatted = card.split(",")
      Card.new(formatted[0], formatted[1], formatted[2].to_sym)
    end
  end
end
