class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  cards_text = File.read("cards.txt")
  cards = cards_text.split("\n")
end
