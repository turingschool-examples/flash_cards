require_relative './card.rb'
require_relative './deck.rb'

class CardGenerator
  def initialize(filename)
    @filename = filename
    @generated_cards = []
  end

  def cards
    file_array = []
    questions = []
    answers = []
    categories = []
    File.open(@filename).each do |line|
      file_array << line.chomp.split(',')
    end
    file_array.each do |card|
      @generated_cards << Card.new(card[0],card[1],card[2])
    end
    @generated_cards
  end
end

# filename = 'cards.txt'
# cards = CardGenerator.new(filename)
# cards.cards
