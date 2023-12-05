require './card'

class CardGenerator
    attr_reader :cards, :file_lines

    
    def initialize (filename)
        @cards = []
        @file_lines = []

        filename.open
        @file_lines = File.read("./#{filename}").chop.split(",")
        
        # File.readlines("./#{filename}").each do |line|
        # @file_lines << line.chop.split(",")
        # end
        

        # file_lines.each do |index|
        #     file = file_lines.shift
        #     card = Card.new((file.first),(file[1]),(file.last))
        #     @cards << card
        # end
        # @cards
    end
    require 'pry'; binding.pry
   
end