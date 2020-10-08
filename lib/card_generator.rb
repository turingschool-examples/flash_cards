require './lib/card'
require 'pry'

class CardGenerator
    attr_reader :filename

    def initialize(filename)
    @filename = filename    
    end

    def cards
        File.open("./lib/#@filename").map do |line|
            line = line.chomp
            card_parts = line.split","
            Card.new(card_parts[0].to_s, card_parts[1].to_s, card_parts[2].to_sym)
        end
    end
end
