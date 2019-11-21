# require './data/cards.txt'
require './lib/card'

class CardGenerator
  attr_reader :card_array

  def initialize
    @card_array = []
  end

  def generate_cards
    File.open('cards.txt').each do |line|
      line_array = line.split(',')
      line_array.each do |section|
        section.strip!
      end
      # p line_array
      card = Card.new(line_array[0], line_array[1], line_array[2])
      @card_array.push(card)
      # p card_array
      # require "pry"; binding.pry
    end
    @card_array
  end

end
