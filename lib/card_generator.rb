require 'pry'

class CardGenerator
    attr_reader :filename
    def initialize(filename)
        @filename = filename

    end

    def output
        @filename.map { |entry| CardGenerator.new(*entry) }
        # binding.pry
    end
    # how do i get cards in this?
    # https://stackoverflow.com/questions/26910338/ruby-array-into-an-object-instance
end