require './lib/card'

class CardGenerator
    attr_reader :filename

    def initialize(filename)
    @filename = filename    
    end

    def cards
        File.open("./lib/#@filename").each do |line|
            card_1 = Card.new(line)
        end
    end
end