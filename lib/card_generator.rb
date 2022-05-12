require './lib/card'

class CardGenerator

  def initialize(filename)
    @cards = File.readlines(filename)
  end

  def cards
    rough_cards = @cards.map do |line|
      line.split(",").map(&:strip)
    end

    # polished_cards = rough_cards.map do |chunk|
    #   [chunk.first.strip, chunk[1].strip, chunk.last.strip.to_sym]
    # end
    #
    # finished_cards = polished_cards.map do |card|
    #   Card.new(card.first, card[1], card.last)
    # end

    finished_cards = rough_cards.map do |card|
      Card.new(card.first.strip, card[1].strip, card.last.strip.to_sym)
    end
  end
end

# require "pry"; binding.pry
