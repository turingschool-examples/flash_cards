require './lib/card'

class CardGenerator
    attr_reader :filename

    def initialize(filename)
        @filename = filename
    end

    def cards
        File.open(@filename, "r") do |file| 
            lines = file.readlines() #creates an array of lines in text file
            split_lines = lines.map { |line| line.split(",") } #returns array of each element w commas removed
            #split_lines = [["What is the capital of Alaska?", " Juneau", " Geography"]]
            parts_of_a_card = split_lines.map { |split_line| split_line.map {|part| part.strip }}
            #first map [["What is the capital of Alaska?", "Juneau", "Geography"]]

            cards = parts_of_a_card.map do |question, answer, category| 
                Card.new(question, answer, category.to_sym)
                #[#<Card:0x00007f9b5ca89518 @answer="Juneau", @category=:Geography, @question="What is the capital of Alaska?">]
            end
            return cards
        end
    end
end