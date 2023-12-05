require './lib/card.rb'

class CardGenerator

    def initialize(file)
        @file = file
        @file_data = []
        @separate_data = []
        @cards = []
    end

    def read_file
        @file_data = File.read(@file).split("\n")
    end

    def separate_data
        @file_data.each do |raw_card_data|
            @separate_data << raw_card_data.split(",")
        end
        @separate_data
    end

    def create_cards
        @separate_data.each do |card_data|
            @cards << Card.new(card_data[0], card_data[1], card_data[2])
        end
        @cards
    end
end