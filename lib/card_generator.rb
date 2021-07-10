require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @raw_cards = File.open(filename, 'r')
  end

  def cards_by_line
    @raw_cards.readlines
  end

  def clean_cards_by_line
    cards_by_line.map { |line| line.chop }
  end

  def lines_without_commas
    clean_cards_by_line.map { |line| line.split(',') }
  end

  def cards
    lines_without_commas.map { |line| Card.new(line[0], line[1], line[2]) }
  end
end

#
# file = 'cards.txt'
#
# cards = File.open(file, 'r')
#
# cards_by_line = cards.readlines
#
# clean_cards_by_line = cards_by_line.map do |line|
#   line.chop
# end
#
# clean_lines = clean_cards_by_line.map do |line|
#   line.split(',')
# end
#
# cards = clean_lines.map do |line|
#   Card.new(line[0], line[1], line[3])
# end
#
# p cards
