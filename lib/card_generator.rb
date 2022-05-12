require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


class Card_generator

  attr_reader :filename

  def initialize(filename)
    @filename = File.read(filename)
    @cards = []
  end

  def card_reader
    file_lines = @filename.lines
    split_file_lines = file_lines.map do |line|
      line.chomp.split(',')
    end
    split_file_lines.each do |line|
      card = Card.new(line[0], line[1], line[2])
      @cards << card
    end
  end
end
