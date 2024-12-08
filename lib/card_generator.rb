# frozen_string_literal: true

require_relative 'card'
# Reads cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    @cards = []
    File.open(filename, 'r') do |file|
      file.each_line do |card|
        card_array = card.split(',')
        @cards << case card_array.size
                  when 2
                    Card.new(card_array[0], card_array[1].chomp)
                  when 3
                    Card.new(card_array[0], card_array[1], card_array[2].chomp)
                  when 4..100
                    answers = []
                    index = 2
                    (card_array.size - 2).times do
                      answers << card_array[index]
                      index += 1
                    end
                    answers.last.chomp!
                    Card.new(card_array[0], card_array[1], answers)
                  end
      end
    end
  end
end
