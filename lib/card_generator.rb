
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class CardGenerator
  attr_reader :deck
  def initialize(filename)
    @filename = filename
    @deck = []
  end

  def create_new_deck
    File.readlines(@filename).each do |line|
      @deck << card_from_line(line)
    end
    @deck
  end

  def card_from_line(line)
    card_pieces = line.split(',').map do |piece|
      if piece.include?("\n")
        piece.delete("\n")
      else
        piece
      end
    end
    Card.new(card_pieces[0], card_pieces[1], card_pieces[2])
  end
end
