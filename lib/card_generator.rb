require './lib/card.rb'

class Card_generator
    attr_reader :file,
                :file_array,
                :file_hash

    def initialize
    @file = File.open('card.txt')
    @file_array = @file.readlines.map(&:chomp)
    @file_hash = 
    end

end