# limitations: no commas in questions
# require './lib/card'

class CardGenerator

  def initialize(filename)
    @cards = File.readlines(filename)
  end

  def cards
    rough_cards = @cards.map do |line|
      line.split(",").map(&:strip)
    end

    finished_cards = rough_cards.map do |card|
      Card.new(card.first.strip, card[1].strip, card.last.strip.to_sym)
    end
  end

end

# require "pry"; binding.pry
