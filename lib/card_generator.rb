# frozen_string_literal: true

require './lib/card'

# Accepts a filename, opens file, and makes cards. File must be formatted properly.
class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def open_cards
    File.open(@filename, 'r')
  end

  def raw_cards_by_line(raw_cards)
    raw_cards.readlines
  end

  def remove_newlines(array)
    array.map { |string| string.chop }
  end

  def split_on_commas(array)
    array.map { |string| string.split(',') }
  end

  # Requires array of arrays. Inner arrays must contain 3 string elements.
  def make_cards_from_array(array)
    array.map { |line| Card.new(line[0], line[1], line[2]) }
  end

  def cards
    raw_cards = open_cards
    raw_cards_array = raw_cards_by_line(raw_cards)
    array_without_newlines = remove_newlines(raw_cards_array)
    array_without_commas = split_on_commas(array_without_newlines)
    make_cards_from_array(array_without_commas)
  end
end
