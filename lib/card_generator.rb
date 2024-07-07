
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

    def card_data
        @card_data = @data.map do |card|
            card.split(",")
        end
    end
end