require './lib/card'

class CardGenerator

    attr_reader :cards

    def initialize(filename)
        @file_lines = File.readlines(filename).map{ |line| line.chomp }
        @cards = []
        self.generate_cards(@file_lines)
    end

    def generate_cards(lines)
        lines.each do |line|
            segments = line.split(/,/)
            @cards << Card.new(segments[0],segments[1].downcase,segments[2])
        end
    end

end