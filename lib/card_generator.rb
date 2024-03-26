require 'pry'

class CardGenerator
    attr_reader :cards

    def initialize
        @cards = []
    end

    def create_cards(filepath)
        content = File.open(filepath) do |card_data_line|
        card_data_line.readlines
        end
        
        card_data_array = content.map {|line| line.chomp.split(",")}
        
        @cards = card_data_array.map do |card_data|
            Card.new(card_data[0], card_data[1], card_data[2].to_sym)
        end
    end
end

require './lib/card.rb'

filepath = "/Users/cheelee/turing_work/1mod/week1/flashcards_project/flash_cards/lib/cards.txt"

generator = CardGenerator.new

some_cards = generator.create_cards(filepath)

puts some_cards.inspect