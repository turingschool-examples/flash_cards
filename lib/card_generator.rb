class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    parse_information(filename)
  end

  def parse_information(filename)
    if(File.file?(filename))
      file = File.open(filename)
      trivia_lines = file.readlines.map(&:chomp)
    else
      trivia_lines = filename.split("\n")
    end
    trivia_lines.each do | line |
      card_info = line.split(',')
      @cards << Card.new(card_info[0], card_info[1], card_info[2])
    end
  end
end
