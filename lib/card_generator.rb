require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename  = filename
  end

  # test this
  def open_cards
    File.open(@filename, 'r')
  end

  # test this
  def raw_cards_by_line(raw_cards)
    raw_cards.readlines
  end

  # Removes '\n' from an array of strings.
  def remove_newlines(array)
    array.map { |string| string.chop }
  end

  # Splits string elements into array of strings, within an array.
  def split_on_commas(array)
    array.map { |string| string.split(',') }
  end

  # Requires array of arrays. Inner arrays must contain 3 string elements.
  def make_cards_from_array(array)
    array.map { |line| Card.new(line[0], line[1], line[2]) }
  end

  def cards
    raw_cards = self.open_cards
    raw_cards_array = raw_cards_by_line(raw_cards)
    array_without_newlines = remove_newlines(raw_cards_array)
    array_without_commas = split_on_commas(array_without_newlines)
    make_cards_from_array(array_without_commas)
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
