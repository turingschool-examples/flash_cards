require './lib/card'

class CardGenerator
  attr_reader :cards
  def initialize(file)
    @cards = []
    @file = File.open(file).read
    @generate_cards = generate_cards
  end

  def generate_cards
    require "pry"; binding.pry
  end
end