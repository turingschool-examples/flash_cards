require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

class CardGenerator

    attr_reader :cards

    def initialize(filename)
        lines = File.read(filename).strip.lines
        @cards = lines.map do |line|
            question, answer, category = line.strip.split(",")
            Card.new(question, answer, category)
        end
    end

end