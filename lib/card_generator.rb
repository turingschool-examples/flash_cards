class CardGenerator
  attr_reader :file, :cards

  def initialize(file)
    @file = File.new(file)
    @cards = []
  end

  def read_to_string
    lines = @file.readlines
    stripped_lines = lines.map {|line| line.rstrip}
  end

  def convert_for_cards(sep)
    parts = read_to_string.map {|line| line.split(sep)}
  end

  def make_cards(sep)
    card_parts = convert_for_cards(sep)
    card_parts.map do |part|
      Card.new(part[0], part[1], part[2])
    end
  end
end
