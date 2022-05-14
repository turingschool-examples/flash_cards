require './card'
require './deck'
require './turn'
require './round'

class CardGenerator
  attr_reader :filename, :data

  def initialize(filename)
    @filename = filename
    @data = []
  end

  def cards
    File.foreach(filename) { |line| @data << line.chomp }
    array = @data.map do |card|
        card.split(",")
    end
    cards = array.map do |array|
       question = array.shift
       answer = array.shift
       category = array.shift
       Card.new(question, answer, category)
    end
  end

end

# filename = "cards.txt"
# cards = CardGenerator.new(filename).cards
# p cards
