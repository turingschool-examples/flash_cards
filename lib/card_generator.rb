
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class CardGenerator
  attr_reader :deck
  def initialize(filename)
    @filename = filename

  end

  def create_new_deck
    cards = []
    File.readlines(@filename).each do |line|
    cards << card_from_line(line)
    end
    Deck.new(cards)
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
