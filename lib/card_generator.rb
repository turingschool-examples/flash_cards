require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

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
    array.map do |array|
       question = array.shift
       answer = array.shift.downcase 
       category = array.shift
       Card.new(question, answer, category)
    end
  end

end
