require './lib/card'
require './lib/deck'

class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def add_cards
    File.readlines(@filename).each do |line|
      split_line = line.rstrip.split(",")
      question = split_line[0]
      answer = split_line[1].downcase
      category = split_line[2].to_sym
      @cards << Card.new(question, answer, category)
    end
  end

  def create_deck
    new_deck = Deck.new(@cards)
  end
end
