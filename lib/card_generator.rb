# frozen_string_literal: true

require_relative 'card'
# Reads cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    File.open(filename, 'r') do |file|
      file.each_line do |card|
        card_array = card.split(',')
        @cards << Card.new(card_array[0], card_array[1], card_array[2].chomp)
      end
    end
  end
end
