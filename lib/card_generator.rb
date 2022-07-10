require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

class CardGenerator

    attr_reader :filename, :cards

    def initialize(filename)
        @filename = filename
        @cards = []
        lines = File.read(filename).strip.lines
        lines.each do |line|
            question, answer, category = line.strip.split(",")
            card = Card.new(question, answer, category)
            @cards << card
        end
    end

end