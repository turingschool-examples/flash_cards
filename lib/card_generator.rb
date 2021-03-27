require "./lib/card"

class CardGenerator

  def initialize(filename)
    @cards = []
    @filename = filename
  end

  def cards
    self.generate_cards_from cards_file(@filename)
  end

  def generate_cards_from(lines)
    lines.map {|line|
      sections = line.split(',')
      Card.new(sections[0], sections[1], sections[2])
    }
  end

  def cards_file(filename)
    IO.readlines(filename).map {|line| line.chomp }
  end

end
