class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read_file
    File.open(@filename).read
  end

  def separate_card_data
    read_file.split("\n")
  end

  def make_strings
    separate_card_data.map do |card|
      card.split(",")
    end
  end

  def cards
    cards = []
    make_strings.each do |string|
      cards << Card.new(string[0], string[1], string[2].to_sym)
    end
    cards
  end

  def close_file
    @filename.close
  end
end
