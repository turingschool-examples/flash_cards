require "pry"
class CardGenerator
    attr_reader :text
    def initialize(text)
        @text = text
    end


    def cards
        created_cards = []
        text1 = File.read(@text)
        lines = text1.split("\n")
        lines.each do |line| 
            var = line.split(",") 
            created_cards << Card.new(var[0],var[1],var[2])
            
            
        end
        created_cards
    end
end