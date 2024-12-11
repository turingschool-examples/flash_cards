# frozen_string_literal: true

require_relative 'card'
# Create cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    File.open(filename, 'r').each_line do |line|
      next if line.start_with?('#') || line.split(',').size < 2

      card_array = line.split(',')
      card_array.last.chomp!
      @cards << Card.new(card_array.shift, card_array.shift, card_array)
    end
  end
end
