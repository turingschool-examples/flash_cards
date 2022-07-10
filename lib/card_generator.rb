require './lib/card'
# require './flashcard_runner'

class CardGenerator 
attr_reader :filename, :cards

    def initialize(filename)
        @filename = filename 
        @cards = []
    end 

    def cards
        @read_file = File.readlines(filename).map{|line| line.chomp}
        @read_file.map do |line|
            @new_card_info = line.split(',')
            @cards << Card.new(@new_card_info[0], @new_card_info[1], @new_card_info[2]) 
        end
        @cards
    end 

end 