require './lib/card'
class CardGenerator
  attr_reader :filename, :file
  def initialize(filename)
    @filename = filename
    @cards = []
    @file = File.new(filename, "r")
  end

  def create_cards
    sanitize_file_cards.map do |line|
      if line.empty? == false
        cards << Card.new(line[0], line[1], line[2])
      end
    end
  end


  def sanitize_file_cards
    read_file.map do |line|
      line.strip.split(",")
    end
  end


  def read_file
    file.readlines
  end

end
