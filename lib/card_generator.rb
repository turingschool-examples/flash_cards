require './card'

class CardGenerator
    attr_reader :cards

    
    def initialize (filename)
        @cards = []
        file_lines = []
        n = 0
        
        file_lines = File.read("./#{filename}").split(/[,\n]/)    

        n = (file_lines.length)/3

        n.times do
           file_line = file_lines.shift(3)
           card = Card.new(file_line.first , file_line[1] , file_line.last)
           @cards << card
          end
       
        @cards
    end
    require 'pry'; binding.pry
   
end