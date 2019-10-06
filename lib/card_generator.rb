require 'pry'
require "./lib/card"

class CardGenerator

  def initialize(path)
    @path = path
  end

  def cards
    card_array = []
    File.readlines(@path).each do |line|
      card_array << Card.new(*line.strip.split(","))
    end
    card_array
  end

end
