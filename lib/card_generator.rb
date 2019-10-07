require './lib/card'

class CardGenerator
  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def create_cards
    File.readlines(@filename).each do |line|
      card_data = line.chomp.split(",")
      question = card_data[0]
      answer = card_data[1]
      category = card_data[2].to_sym
      @cards << Card.new(question, answer, category)
    end
  end
end

File.readlines("./lib/cards.txt").each do |line|
  line
end
require 'pry'; binding.pry

deck = CardGenerator.new("./lib/cards.txt").create_cards

require 'pry'; binding.pry
# cards = CardGenerator.new("cards.txt").get_text
#
# deck = cards.map do |card|
#   card.split(",")
#   Card.new(card.split(",")[0],card.split(",")[1],card.split(",")[2])
# end
