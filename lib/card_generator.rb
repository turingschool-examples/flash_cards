class CardGenerator
    attr_reader :filename,
                :data

    def initialize(filename)
        @filename = filename
        @data = get_data
        @card_data = card_data
    end

    def get_data
        @data = File.readlines(filename)
        @data = @data.map do |card|
            card.chomp
        end
    end

    def card_data
        @card_data = @data.map do |card|
            card.split(",")
        end
    end

    def cards
        @cards = @card_data.map do |card|
            Card.new(card[0], card[1], card[2])
        end
    end
end