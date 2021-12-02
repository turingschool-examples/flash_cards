require './lib/card'

class CardGenerator
  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    @file = File.open("lib/#{filename}", "r")
    @file.map do |line|
      line.chomp!
      line = line.split(',')
      @cards << Card.new(line[0], line[1], line[2])
    end
  end
end
