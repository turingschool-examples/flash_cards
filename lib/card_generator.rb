require './lib/card'

class CardGenerator
  attr_reader :filename
  attr_accessor :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    File.open(@filename).each do |line|
      question = line.split(',')[0]
      answer = line.split(',')[1]
      category = line.split(',')[2]
      card = Card.new(question, answer, category)
      @cards << card
    end
    @cards
  end
end
