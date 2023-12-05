class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    card_lines.map { |line| create_card_from_line(line) }
  end

  def card_lines
    File.readlines(@filename, chomp: true)
  end

  def create_card_from_line(line)
    parts = line.split(',')
    Card.new(parts[0], parts[1], parts[2])
  end
end