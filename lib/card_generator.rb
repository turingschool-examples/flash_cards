require "pry"

class CardGenerator

  attr_reader :cards, :filename

  def initialize(cards, filename)
      @filename = filename
      @cards = []
  end

  def cards
    file = File.open(filename, "r")
    file_data = file.readlines.map(&:chomp)
    @cards << file_data
  end

end
# binding.pry

# pry(main)> filename = "cards.txt"
# pry(main)> cards = CardGenerator.new(filename).cards
