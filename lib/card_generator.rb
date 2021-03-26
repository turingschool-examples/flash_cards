require 'csv'
require './lib/card'

class CardGenerator
    attr_accessor :csv, :cards
    def initialize(filename)
        @cards = []
        parse_CSV(filename)
    end

    def parse_CSV(filename)
        CSV.foreach(filename) do |line|
            @cards << Card.new(line[0],line[1],line[2])
        end
    end
end