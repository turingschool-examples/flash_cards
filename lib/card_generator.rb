require 'card'

class CardGenerator
    attr_reader :filename,
                :file,
                :data

    def initialize(filename)
        @filename = filename
        @file = set_file
        @data = get_data
    end

    def set_file
        @file = File.open(@filename)
    end

    def get_data
        @data = file.readlines.map(&:chomp)
    end

    def file_close
        @file.close
    end

    def card_data
        @card_data = @data.map do |card|
            card.split(",")
        end
    end

    def cards
        @cards = @card_data.map do |card|
            Card.new(card[0], card[1], card[3])
        end
    end
end