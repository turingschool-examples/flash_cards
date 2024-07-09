require './lib/card.rb'

class CardGenerator
    attr_accessor :file_array
    
    attr_reader :file,
                :convert_to_useful,
                :cards_created,
                :cards



    def initialize(file)
        @file = File.open(file)
        @file_array = @file.readlines.map(&:chomp)
        @cards_created = self.file_array.length
        @convert_to_useful = convert_to_useful
        @cards = cards
    end 

    def convert_to_useful
        useful_array = []
        @file_array.map {|card|
            useful_array.push(card.split(','))
        }
        @file_array = useful_array
    end

    def cards
        card_count = 0
        deck = []
        @file_array.each {|card|
        question = @file_array[card_count][0]
        answer = @file_array[card_count][1]
        category = @file_array[card_count][2]
        card = Card.new(question, answer, category)
        deck.push(card)
        card_count += 1
        }
        return deck
    end
end