class CardGenerator
attr_reader :cards
  def initialize(filename = nil)
    @filename = filename
    @cards = []
    @cards = convert_lines_to_cards(self.read_in_file)
  end

  def read_in_file
    lines = []
    File.open(@filename).each do |line|
      lines << line
    end
    lines
  end

  def convert_lines_to_cards(lines)
    lines.each do |line|
      card_parameters = line.split(",")
      cards << Card.new(card_parameters[0], card_parameters[1], card_parameters[3])
    end
   @cards
  end
end
