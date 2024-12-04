# frozen_string_literal: true

require_relative 'card'
# Reads cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename)
    # Create an empty array to put cards into
    @cards = []
    # Open the file with read-only permissions
    File.open(filename, 'r') do |file|
      # For each individual line in the file, do the following
      file.each_line do |card|
        # Create an array of strings by splitting the line at each comma
        card_array = card.split(',')
        # Create a new card using each entry and add it to the cards array. Chomp is necessary to remove the line break
        @cards << Card.new(card_array[0], card_array[1], card_array[2].chomp)
      end
    end
  end
end
