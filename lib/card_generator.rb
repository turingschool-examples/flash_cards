require './card'

class CardGenerator
    attr_reader :cards

    
    def initialize (filename)
        @cards = []
        file_lines = []

        file_lines = File.read("./#{filename}").split(/[,\n]/)      

        file_lines.each do |index|
          question = file_lines[1]
          file_lines.shift
          answer = file_lines[1]
          file_lines.shift
          category = file_lines[1]
          card = Card.new(question,answer,category)
          @cards << card
         end
       
        @cards
    end
    require 'pry'; binding.pry
   
end