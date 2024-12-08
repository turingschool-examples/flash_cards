# frozen_string_literal: true

require_relative 'card'
# Create cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    @cards = []
    File.open(filename, 'r').each_line do |line|
      next if line.empty? || line.start_with?('#') || line.split(',').size < 2

      card_array = line.split(',')
      answers = []
      index = 2
      (card_array.size - 2).times do
        answers << card_array[index]
        index += 1
      end
      answers&.last&.chomp!
      @cards << Card.new(card_array[0], card_array[1], answers)
    end
  end
end
