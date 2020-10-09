require './lib/card'

class CardGenerator
  attr_reader :filename, :cards, :raw_data

  def initialize(filename)
    @filename = filename
    @cards = []
    @raw_data = []
  end

  def open_file
    file = File.open(filename)
    @raw_data = file.read.split("\n")
  end
end