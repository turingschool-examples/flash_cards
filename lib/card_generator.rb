
class CardGenerator
    def initialize(filename)
        @filename = filename
    end

    def cards
        cards_file = File.open(@filename).read
        cards_file.map do |line|
            question,answer,category = line.split.chomp
            
        end
            Card.new(question,answer,category)
    end
end