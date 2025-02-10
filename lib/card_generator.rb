
class CardGenerator
    def initialize(filename)
        @filename = filename
    end

    def cards
        File.open(@filename).map do |line| 
        # cards_file = File.open(@filename).read
        # cards_file.map do |line|
            question, answer, category = line.split(",")
            
        # end
            Card.new(question,answer,category)
        end
    end
end

