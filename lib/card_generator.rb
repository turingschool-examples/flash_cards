require "./lib/card"

class CardGenerator
    attr_reader :file_name
    
    def initialize(file_name)
        @file_name = file_name
    end

    def cards
        trivia_list = []
        File.readlines(@file_name, chomp:true).each do |line|
            trivia_list << line.split(", ")
        end
        trivia_list
        
        cards_list = []
        trivia_list.each do |card_info|
            cards_list << Card.new(card_info[0], card_info[1], card_info[2])
        end
        cards_list
    end
end
