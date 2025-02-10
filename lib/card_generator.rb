
class CardGenerator
    def initialize(filename)
        @filename = filename
    end

    def cards
        cards_file = File.open(@filename)
        cards_file.map do |line|
            question,answer,category = line.split(",")
            Card.new(question,answer,category)
        end
    end
end

