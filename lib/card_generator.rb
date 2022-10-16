require './lib/card'
class CardGenerator
  attr_reader :filename, :file, :cards
  def initialize(filename)
    @filename = filename
    @file = File.new(filename, "r")
    @cards = create_cards
  end



  def create_cards
    created_cards = sanitize_file_lines.map do |line|
        Card.new(line[0], line[1], line[2])
    end

  end


  def sanitize_file_lines
    stripped_lines = read_file.map do |line|
      line.strip.split(",")
    end
    stripped_lines.delete_if {|line| line.empty?}
  end


  def read_file
    file.readlines
  end

end
