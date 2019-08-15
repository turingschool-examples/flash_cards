require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class CardGenerator
attr_reader :cards, :filename

  def initialize(filename)
    @filename = filename
    @cards = create_cards
  end

  def create_cards
    empty = []
    File.open(@filename).each do |line|
      i = 1
      array = line.to_s.chomp.split(", ")
      card_i = Card.new(array[0], array[1], array[2].to_sym)
      empty << card_i
      i+=1
    end
    empty
  end

end
