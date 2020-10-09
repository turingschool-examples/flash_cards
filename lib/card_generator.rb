require 'pry'
class CardGenerator
  attr_reader :file
  def initialize(file)
    @file = file
  end
  def cards
       @file.map do |line|
       card = line.split(',')
       card = Card.new(card[0], card[1], card[2])
    end
  end
end
